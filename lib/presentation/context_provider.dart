import 'package:defi/presentation/screens/choose_currency_screen.dart';
import 'package:defi/service_locator.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ContextProviderWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget? child) builder;
  final Function(T)? onModelReady;
  const ContextProviderWidget(
      {required this.builder, this.onModelReady, Key? key})
      : super(key: key);

  @override
  ContextProviderWidgetState<T> createState() =>
      ContextProviderWidgetState<T>();
}

class ContextProviderWidgetState<T extends ChangeNotifier>
    extends State<ContextProviderWidget<T>> {
  T model = sl.get<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
