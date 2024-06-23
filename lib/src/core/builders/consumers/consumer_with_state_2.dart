import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:moniepoint_flutter_assessment/src/config/routes/app_routes.dart';
import 'package:provider/provider.dart';

import '../../typedefs/typedefs.dart';

class ConsumerWithState2<T, K> extends StatefulWidget {
  final ConsumerBuilderCallBack2<T, K> builder;
  final ConsumerInitCallBack2<T, K>? onInit;
  final ConsumerReadyCallBack2<T, K>? onReady;
  final ConsumerDisposeCallBack2<T, K>? onDispose;

  const ConsumerWithState2(
      {super.key,
      required this.builder,
      this.onInit,
      this.onReady,
      this.onDispose});

  @override
  State<ConsumerWithState2<T, K>> createState() =>
      _ConsumerWithOnReadyCallBackState2<T, K>();
}

class _ConsumerWithOnReadyCallBackState2<T, K>
    extends State<ConsumerWithState2<T, K>> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<T, K>(builder: (context, viewModel, viewModel2, child) {
      return widget.builder(context, viewModel, viewModel2, child);
    });
  }

  @override
  void initState() {
    if (widget.onInit != null) {
      widget.onInit!(Provider.of<T>(context, listen: false),
          Provider.of<K>(context, listen: false));
    }
    SchedulerBinding.instance.addPostFrameCallback((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (widget.onReady != null) {
          widget.onReady!(Provider.of<T>(context, listen: false),
              Provider.of<K>(context, listen: false));
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose!(
          Provider.of<T>(navigatorKey.currentState!.context, listen: false),
          Provider.of<K>(navigatorKey.currentState!.context, listen: false));
    }
    super.dispose();
  }
}
