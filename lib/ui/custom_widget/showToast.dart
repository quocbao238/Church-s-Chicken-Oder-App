import 'package:flutter/widgets.dart';
import 'package:toast/toast.dart';

void showToast({String msg, BuildContext context}) {
  Toast.show(msg, context, gravity: Toast.BOTTOM,duration: Toast.LENGTH_LONG);
}
