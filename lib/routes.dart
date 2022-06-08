import 'package:flutter/material.dart';
import 'package:maveshi/all_screens.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  TabScreen.routeName: (context) => const TabScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  MilkReportScreen.routeName: (context) => const MilkReportScreen(),
  FinanceReportScreen.routeName: (context) => const FinanceReportScreen(),
  SettingsScreen.routeName: (context) => const SettingsScreen(),
  AddAnimalScreen.routeName: (context) => const AddAnimalScreen(),
  AnimalDetailsScreen.routeName: (context) => const AnimalDetailsScreen(),
  GroupViewScreen.routeName: (context) => const GroupViewScreen(),
};
