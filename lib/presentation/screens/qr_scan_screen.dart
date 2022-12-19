import 'dart:io';

import 'package:defi/constants/app_colors.dart';
import 'package:defi/helpers/crypto_symbols.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanScreen extends StatefulWidget {
  static const routeName = "/qr-scan";
  const QrScanScreen({Key? key}) : super(key: key);

  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<bool> requestPermission() async {
    PermissionStatus status = await Permission.camera.status;
    if (status.isDenied) {
      Permission.camera.request().then((value) {
        status = value;
      });
    }
    return status.isGranted;
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  Widget buildQrScan() => QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay:
            QrScannerOverlayShape(
              borderColor: blue,
              borderRadius: 20,
              borderWidth: 10,
              cutOutSize: ScreenUtil().screenWidth * 0.7),
      );

  @override
  Widget build(BuildContext context) {
    requestPermission();
    return Scaffold(
        body: FutureBuilder(
            future: requestPermission(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Center(child: Text("Erreur"));
                }
                return Stack(
                  alignment: Alignment.center,
                  children: [buildQrScan()],
                );
              }
              return const Center(
                child: Text("Loading"),
              );
            }));
  }
}
