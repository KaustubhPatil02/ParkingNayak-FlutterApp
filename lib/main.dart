import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parking_nayak/firebase_options.dart';
import 'package:parking_nayak/presentation/pages/auth/auth_screen.dart';
import 'package:parking_nayak/presentation/pages/home/home_screen.dart';
import 'package:parking_nayak/presentation/pages/intro_screen/intro_screen.dart';
import 'package:parking_nayak/presentation/pages/receipt_screen/receipt_screen.dart';
import 'package:parking_nayak/utils/local_storage.dart';
import 'package:parking_nayak/utils/shared_prefs.dart';

import 'domain/provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

bool introScreen = true;

class _MyAppState extends ConsumerState<MyApp> {
  final isAuthCheck = LocalStorage.getAuth() ?? false;
final isIntro = LocalStorage.getIntro() ?? true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking Nayak',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: ReceiptScreen(filePath: ""),
      home: isIntro
          ? IntroScreen()
          : (isAuthCheck ? const HomeScreen() : const PhoneAuthPage()),
    );
  }
}
