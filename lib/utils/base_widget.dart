import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final T model;
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onInitState;
  final Function(T)? didChangeDependencies;
  final Function(T)? didUpdateWidget;

  const BaseWidget(
      {Key? key,
      required this.model,
      required this.builder,
      this.onInitState,
      this.didUpdateWidget,
      this.didChangeDependencies})
      : super(key: key);

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  late T model;
  bool isOffline = false;
  @override
  void initState() {
    if (!mounted) return;
    model = widget.model;

    if (widget.onInitState != null) {
      widget.onInitState!(model);
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    model = widget.model;

    // if (kDebugMode) {
    //   print('<<<<<<<<<<<<didChangeDependencies>>>>>>>>>>>>>>');
    // }

    if (widget.didChangeDependencies != null) {
      widget.didChangeDependencies!(model);
    }
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant BaseWidget<T> oldWidget) {
    // if (kDebugMode) {
    //   print('<<<<<<<<<<<<didUpdateWidget>>>>>>>>>>>>>>');
    // }
    if (widget.didUpdateWidget != null) {
      widget.didUpdateWidget!(model);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // if (kDebugMode) {
    //   print('<<<<<<<<<<<<dispose>>>>>>>>>>>>>>');
    // }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider<T>.value(
    //   value: model,
    //   child: Consumer<T>(
    //     builder: widget.builder,
    //   ),
    // );
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
