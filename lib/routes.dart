import 'package:flutter/material.dart';

import 'Categories/catego_list.dart';
import 'SignIn/sign_in_screen.dart';
import 'SignUp/sign_up_screen.dart';
import 'SplashScreen/splash_screen.dart';
import 'Store/store_details.dart';
import 'Store/store_home.dart';
import 'forgot_password/forgot_password_screen.dart';
import 'home/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  StoreHome.routeName: (context) => StoreHome(),
  CategoriesList.routeName: (context) => CategoriesList(),
  StoreDetail.routeName: (context) => StoreDetail()
};
