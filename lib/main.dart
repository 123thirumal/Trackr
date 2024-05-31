import 'package:flutter/material.dart';
import 'package:trakr/screens/home_screen.dart';

void main(){
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
    ),

    themeMode: ThemeMode.dark,

    home: const HomeScreen(),
  ));
}