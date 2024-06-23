import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:moniepoint_flutter_assessment/src/config/routes/app_routes.dart';
import 'package:provider/provider.dart';

import '../../typedefs/typedefs.dart';

class ConsumerWithState<T> extends StatefulWidget {
  final ConsumerBuilderCallBack<T> builder;
  final ConsumerInitCallBack<T>? onInit;
  final ConsumerDidUpdateWidgetCallBack<T>? onDidUpdateWidget;
  final ConsumerDisposeCallBack<T>? onDispose;
  final ConsumerReadyCallBack<T>? onReady;

  const ConsumerWithState(
      {super.key,
      required this.builder,
      this.onInit,
      this.onDidUpdateWidget,
      this.onReady,
      this.onDispose});

  @override
  State<ConsumerWithState<T>> createState() => _ConsumerWithStateState<T>();
}

class _ConsumerWithStateState<T> extends State<ConsumerWithState<T>> {
  @override
  Widget build(BuildContext context) {
    return Consumer<T>(builder: (context, viewModel, child) {
      return widget.builder(context, viewModel, child);
    });
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose!(
          Provider.of<T>(navigatorKey.currentState!.context, listen: false));
    }
    super.dispose();
  }

  @override
  void initState() {
    if (widget.onInit != null) {
      widget.onInit!(Provider.of<T>(context, listen: false));
    }
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (widget.onReady != null) {
          widget.onReady!(Provider.of<T>(context, listen: false));
        }
      });
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ConsumerWithState<T> oldWidget) {
    widget.onDidUpdateWidget?.call(
        Provider.of<T>(navigatorKey.currentState!.context, listen: false));
    super.didUpdateWidget(oldWidget);
  }
}
