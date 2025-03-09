import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:workshop_app/workshop_app.dart';
import 'core/logic/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => WorkShopApp(),
  );
  await CacheHelper.init();
  runApp(const WorkShopApp());
}