import 'package:flutter/material.dart';
import 'package:laundry_ease/features/cart/pages/cart_page.dart';
import 'package:laundry_ease/features/chat/pages/chat_page.dart';
import 'package:laundry_ease/features/home/pages/home.dart';
import 'package:laundry_ease/features/home/pages/placeholder.dart';
import 'package:laundry_ease/features/onboarding/pages/onboarding1.dart';
import 'package:laundry_ease/features/registration/signin/pages/login_page.dart';
import 'package:laundry_ease/features/registration/signup/pages/register_page.dart';
import 'package:laundry_ease/features/onboarding/pages/splash_screen.dart';
import 'package:laundry_ease/features/registration/signup/pages/sign_up_page.dart';
import 'package:laundry_ease/features/password_reset/forgot_password_page.dart';
import 'package:laundry_ease/features/profile/pages/profile_page.dart';
import 'features/home/bloc/home_cubit.dart';
import 'features/home/pages/home_page.dart';
import 'features/onboarding/pages/onboarding2.dart';
import 'features/onboarding/pages/onboarding3.dart';
import 'features/registration/signup/pages/agent_signup_page.dart';
import 'firebase_options.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/Onboarding1': (context) => Onboarding1(),
  '/Onboarding2': (context) => Onboarding2(),
  '/Onboarding3': (context) => Onboarding3(),
  '/RegisterPage': (context) => RegisterPage(),
  '/SignUpPage': (context) => SignUpPage(),
  '/AgentSignUpPage': (context) => AgentSignUpPage(),
  '/ForgotPasswordPage': (context) => ForgotPasswordPage(),
  '/LoginPage': (context) => LoginPage(),
  '/HomePage': (context) => HomePage(),
  '/PlaceHolder': (context) => PlaceHolder(),
  '/ProfilePage': (context) => ProfilePage(),
  '/CartPage': (context) => CartPage(),
  '/ChatPage': (context) => ChatPage(),
};
