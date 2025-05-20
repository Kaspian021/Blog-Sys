import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loading() {
  return const SpinKitCircle(
    color: Colors.blue,
    size: 30,
    duration: Duration(milliseconds: 300),
  );
}
