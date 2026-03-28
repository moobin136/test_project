import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:test_project/app.dart';

void main() => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => MyApp(),
      ),
    );
