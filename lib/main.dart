import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laundry_ease/features/home/pages/home.dart';
import 'package:laundry_ease/features/onboarding/pages/onboarding1.dart';
import 'package:laundry_ease/features/registration/signin/pages/login_page.dart';
import 'package:laundry_ease/features/registration/signup/pages/register_page.dart';
import 'package:laundry_ease/features/onboarding/pages/splash_screen.dart';
import 'package:laundry_ease/features/registration/signup/pages/sign_up_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/onboarding/pages/onboarding2.dart';
import 'features/onboarding/pages/onboarding3.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final bool onboardingComplete = prefs.getBool('onboardingComplete') ?? false;

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.black38),
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp(onboardingComplete: onboardingComplete));
}

class MyApp extends StatelessWidget {
  final bool onboardingComplete;

  const MyApp({Key? key, required this.onboardingComplete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        primaryColor: const Color(0xFF2196F3),
        // Set primary color
        primaryColorLight: const Color(0xFF64B5F6),
        // Set light theme primary color
        primaryColorDark: const Color(0xFF1976D2),
      ),
      home: onboardingComplete ? RegisterPage() : SplashScreen(),
      routes: {
        '/Onboarding1': (context) => Onboarding1(),
        '/Onboarding2': (context) => Onboarding2(),
        '/Onboarding3': (context) => Onboarding3(),
        '/RegisterPage': (context) => RegisterPage(),
        '/SignUpPage': (context) => SignUpPage(),
        '/LoginPage': (context) => LoginPage(),
        '/Home': (context) => Home(),
      },
    );
  }
}
