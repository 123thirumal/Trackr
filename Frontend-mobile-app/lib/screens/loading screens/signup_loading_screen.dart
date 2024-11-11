import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../home_screen.dart';

class SignUpLoadingScreen extends StatefulWidget{
  const SignUpLoadingScreen({super.key,required this.userName,required this.userEmail,required this.userPassword});

  final String userName;
  final String userEmail;
  final String userPassword;

  @override
  State<SignUpLoadingScreen> createState() {
    return _SignUpLoadingScreenState();
  }
}

class _SignUpLoadingScreenState extends State<SignUpLoadingScreen> {
  String? errorMessage;

  Future<void> handleSignup() async {
    final name = widget.userName;
    final email = widget.userEmail;
    final password = widget.userPassword;

    final url = Uri.parse('http://192.168.76.151:5000/auth/signup');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print("User signed up successfully: $data");

        // Navigate to the homepage or show a success message
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
          return const HomeScreen();
        })); // Replace with your route name
      } else {
        errorMessage = data['message'] ?? 'An error occurred during signup';

        print(errorMessage);
        print(data['message']);
      }
    } catch (error) {
      errorMessage = 'Error during signup: $error';

      print(errorMessage);
      print("Error during signup: $error");
    }
  }

  @override
  void initState(){
    super.initState();
    handleSignup();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SpinKitWave(
        color: Colors.white,
      ),
    );
  }
}
