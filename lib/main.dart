import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ud_mobile_app/core/app.dart';
import 'package:ud_mobile_app/injection/injection.dart';

FutureOr<void> main() async {
  await configureDependencies();
  runApp(const MyApp());
}
