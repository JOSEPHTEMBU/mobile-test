import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  void createUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/signup.png'),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Stay on top of your finance with us.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'We are your new financial Advisors to recommend the best investments for you.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/createAccount');
              },
              child: Text('Create Account'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Button color
                onPrimary: Colors.white, // Text color
                minimumSize: Size(300, 50), // Button size: width, height
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/createAccount'),
              child: Center(
                child: Text(
                  'Log in',
                  style: TextStyle(fontSize: 15, color: Colors.green),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
