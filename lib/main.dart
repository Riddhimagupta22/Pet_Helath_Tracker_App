import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:pet_app/Controller/User_controller.dart';
import 'package:pet_app/Modules/Starting%20Screen/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://bfvsnaymuqovpglmkuvz.supabase.co',
    anonKey:
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJmdnNuYXltdXFvdnBnbG1rdXZ6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTEzODY4MDcsImV4cCI6MjA2Njk2MjgwN30.zxOx5PLlWL5egOiOc7wscWRKiB8ValGytjZuLRgyRwA',
  );

  Get.put(UserController());


  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  runApp(const MyApp());
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  // Initialize with your OneSignal App ID
  OneSignal.initialize("a0ac5b7a-9af9-42db-b879-e6f1d0476c48");
  // Use this method to prompt for push notifications.
  // We recommend removing this method after testing and instead use In-App Messages to prompt for notification permission.
  OneSignal.Notifications.requestPermission(false);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet App',
      theme: ThemeData(
        colorScheme:
        ColorScheme.fromSeed(seedColor: const Color.fromRGBO(243, 120, 29, 1)),
        useMaterial3: true,
      ),
      home: const Splash(),
    );
  }
}
