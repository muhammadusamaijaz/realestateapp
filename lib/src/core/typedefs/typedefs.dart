import 'package:flutter/material.dart';

/// ----------------------------------------------------------------------------
/// CUSTOM SCREEN UTIL
/// ----------------------------------------------------------------------------
typedef ScreenUtilResponsiveBuilder = Widget Function(BuildContext);

/// ----------------------------------------------------------------------------
/// CONSUMER CALLBACKS
/// ----------------------------------------------------------------------------
typedef ConsumerBuilderCallBack<T> = Widget Function(BuildContext, T, Widget?);
typedef ConsumerBuilderCallBack2<T, K> = Widget Function(
    BuildContext, T, K, Widget?);
typedef ConsumerInitCallBack<T> = Function(T);
typedef ConsumerDidUpdateWidgetCallBack<T> = Function(T);
typedef ConsumerDisposeCallBack<T> = Function(T);
typedef ConsumerReadyCallBack<T> = Function(T);
typedef ConsumerInitCallBack2<T, K> = Function(T, K);
typedef ConsumerDisposeCallBack2<T, K> = Function(T, K);
typedef ConsumerReadyCallBack2<T, K> = Function(T, K);

/// ----------------------------------------------------------------------------
/// POP SCOPE CALLBACKS
/// ----------------------------------------------------------------------------
typedef OnWillPopCallBack = void Function(bool);
