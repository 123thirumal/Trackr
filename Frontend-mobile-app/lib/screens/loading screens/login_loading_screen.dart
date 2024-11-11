import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trackr/screens/home_screen.dart';

class LoginLoadingScreen extends StatefulWidget{
  const LoginLoadingScreen({super.key,required this.userEmail,required this.userPassword});

  final String userEmail;
  final String userPassword;

  @override
  State<LoginLoadingScreen> createState(){
    return _LoginLoadingScreenState();
  }
}

class _LoginLoadingScreenState extends State<LoginLoadingScreen> {
  String? errorMessage;

  Future<void> handleLogin() async {
    final email = widget.userEmail;
    final password = widget.userPassword;

    final url = Uri.parse('http://192.168.76.151:5000/auth/login');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['jwtToken'];

        // Save token and user data to storage (e.g., using shared_preferences)
        print('Login successful! Token: $token');
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
          return const HomeScreen();
        }));
      } else {
        final data = jsonDecode(response.body);
        errorMessage = data['message'] ?? 'An error occurred';
        print(errorMessage);
      }
    } catch (e) {
      errorMessage = 'Failed to connect to the server';
      print(errorMessage);
      print('Login failed: $e');
    }
  }


  @override
  void initState(){
    super.initState();
    handleLogin();
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
