import 'dart:io';
import 'package:flutter/material.dart';
import 'package:trackr/screens/loading%20screens/signup_loading_screen.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() {
    return _SignUpWidget();
  }
}

class _SignUpWidget extends State<SignUpWidget> {
  final _formkey = GlobalKey<FormState>();
  String _enteredEmail = '';
  String _enteredPassword = '';
  String _enteredUserName = '';

  @override
  Widget build(context) {
    return Form(
      key: _formkey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hello",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
              ),
            ),
            const Text(
              "Create a new account",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  maxLength: 50,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF2A2A2A),
                    labelText: "Enter your name",
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ThemeData().colorScheme.primary),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    counterText: '',
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return "Enter a valid name";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _enteredUserName = value!;
                  },
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 35,
                ),
                TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  maxLength: 50,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF2A2A2A),
                    labelText: "Enter your email",
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ThemeData().colorScheme.primary),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    counterText: '',
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50 ||
                        !value.trim().contains('@')) {
                      return "Enter a valid email ID";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _enteredEmail = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 35,
                ),
                TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  maxLength: 50,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF2A2A2A),
                    labelText: "Enter your Password",
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ThemeData().colorScheme.primary),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    counterText: '',
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return "Enter a valid password";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _enteredPassword = value!;
                  },
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return SignUpLoadingScreen(
                              userName: _enteredUserName,
                              userEmail: _enteredEmail,
                              userPassword: _enteredPassword,
                          );
                        }));
                      }
                    },
                    child: const Text("Login")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
