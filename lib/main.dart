import 'package:flutter/material.dart';
import 'package:test_project/app.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (BuildContext context) {
        return const Slide();
      },
    ),
  );
}
