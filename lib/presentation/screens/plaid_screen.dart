import 'package:flutter/material.dart';
import 'package:plaid_flutter/plaid_flutter.dart';
import 'dart:async';

class PlaidScreen extends StatefulWidget {
  static const routeName = "/plaid";
  const PlaidScreen({super.key});

  @override
  State<PlaidScreen> createState() => _PlaidScreenState();
}

class _PlaidScreenState extends State<PlaidScreen> {
  LinkTokenConfiguration? _configuration;
  StreamSubscription<LinkEvent>? _streamEvent;
  StreamSubscription<LinkExit>? _streamExit;
  StreamSubscription<LinkSuccess>? _streamSuccess;
  LinkObject? _successObject;

  @override
  void initState() {
    super.initState();

    _streamEvent = PlaidLink.onEvent.listen(_onEvent);
    _streamExit = PlaidLink.onExit.listen(_onExit);
    _streamSuccess = PlaidLink.onSuccess.listen(_onSuccess);
  }

  @override
  void dispose() {
    _streamEvent?.cancel();
    _streamExit?.cancel();
    _streamSuccess?.cancel();
    super.dispose();
  }

  void _createLinkTokenConfiguration() {
    setState(() {
      _configuration = const LinkTokenConfiguration(
        token: "link-sandbox-bea1028d-a800-4d0d-a78d-84fd13b26ffd",
      );
    });
  }

  void _onEvent(LinkEvent event) {
    final name = event.name;
    final metadata = event.metadata.description();
    print("onEvent: $name, metadata: $metadata");
  }

  void _onSuccess(LinkSuccess event) {
    final token = event.publicToken;
    final metadata = event.metadata.description();
    print("onSuccess: $token, metadata: $metadata");
    setState(() => _successObject = event);
  }

  void _onExit(LinkExit event) {
    final metadata = event.metadata.description();
    final error = event.error?.description();
    print("onExit metadata: $metadata, error: $error");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(
                    _configuration?.toJson().toString() ?? "",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const ElevatedButton(
                onPressed: null,
                child: Text("Create Legacy Token Configuration"),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: _createLinkTokenConfiguration,
                child: const Text("Create Link Token Configuration"),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: _configuration != null
                    ? () => PlaidLink.open()
                    : null,
                child: const Text("Open"),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    _successObject?.toJson().toString() ?? "",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
