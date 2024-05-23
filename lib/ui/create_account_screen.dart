import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_test/bloc/authentication_bloc.dart';

class CreateAccountScreen extends StatelessWidget {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text('Create Account',
                  style: TextStyle(fontSize: 26, color: Colors.black)),
            ),
            SizedBox(height: 5),
            Center(
              child: Text('Invest and double your income now',
                  style: TextStyle(fontSize: 15)),
            ),
            SizedBox(height: 50),
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                hintText: 'Full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email Address',
                hintText: 'Email Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: Text('Password', style: TextStyle(fontSize: 15)),
            // ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity, // Make button take full width
              height: 50, // Set button height
              child: ElevatedButton(
                onPressed: () async {
                  final authBloc = BlocProvider.of<AuthenticationBloc>(context);
                  try {
                    final newUser = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    authBloc.add(LoggedIn());

                    if (newUser != null) {
                      Navigator.pushNamed(context, '/home');
                    }
                  } catch (e) {
                    // Handle error
                    print("::::::: ${e.toString()}");
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Set button color
                  onPrimary: Colors.white, // Set text color
                ),
                child: Text('Create Account'),
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/home'),
              child: Center(child: Text('Already have an account? ')),
            ),
          ],
        ),
      ),
    );
  }
}
