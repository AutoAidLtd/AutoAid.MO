import 'package:autoaid/app.dart';
import 'package:autoaid/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await _initApp();
  runApp(AutoAid());
}

Future<void> _initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'auto-aid',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AppDependencies.initialize();
  // await FirebaseNotification().initNotifications();
}
