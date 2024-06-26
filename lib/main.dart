import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_ease/agent/agent_home/pages/agent_home_page.dart';
import 'package:laundry_ease/app_routes.dart';
import 'package:laundry_ease/features/cart/model/cart_model.dart';
import 'package:laundry_ease/features/cart/pages/cart_page.dart';
import 'package:laundry_ease/features/chat/pages/chat_page.dart';
import 'package:laundry_ease/features/home/pages/home.dart';
import 'package:laundry_ease/features/home/pages/placeholder.dart';
import 'package:laundry_ease/features/onboarding/pages/onboarding1.dart';
import 'package:laundry_ease/features/registration/signin/pages/login_page.dart';
import 'package:laundry_ease/features/registration/signup/pages/register_page.dart';
import 'package:laundry_ease/features/onboarding/pages/splash_screen.dart';
import 'package:laundry_ease/features/registration/signup/pages/sign_up_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/home/bloc/home_cubit.dart';
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
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<HomeBloc>(
              create: (BuildContext context) => HomeBloc(),
            ),
            // Add more BlocProviders as needed
          ],
          child: MaterialApp(
            title: 'Laundry Ease',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              primaryColor: const Color(0xFF5229b6),
              // Set primary color
              primaryColorLight: const Color(0xFF7E57C2),
              // Set light theme primary color
              primaryColorDark: const Color(0xFF1976D2),
            ),
            home: onboardingComplete ? RegisterPage() : SplashScreen(),
            routes: appRoutes,
          ),
        ),
      ),
    );
  }
}
