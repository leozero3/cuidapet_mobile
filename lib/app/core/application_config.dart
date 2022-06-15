import 'package:cuidapet_mobile/app/core/helpers/environments.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ApplicationConfig {
  Future<void> configureApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _firebaseCoreConfigure();
    await _loadEnvs();
  }

  _firebaseCoreConfigure() async {
    await Firebase.initializeApp();
  }

  Future<void> _loadEnvs() => Environments.loadEnvs();
}
