import 'package:flutter/material.dart';
import 'package:trackr/screens/auth-screen.dart';
import 'package:trackr/screens/check.dart';
import 'package:trackr/screens/home_screen.dart';

void main(){
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
    ),

    themeMode: ThemeMode.dark,

    home: const AuthScreen(),
  ));
}