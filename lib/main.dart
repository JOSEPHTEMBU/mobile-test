import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'bloc/authentication_bloc.dart';
import 'ui/create_account_screen.dart';
import 'ui/home_screen.dart';
import 'ui/signup_screen.dart';
import 'ui/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthenticationBloc(FirebaseAuth.instance)..add(AppStarted()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mobile Test App',
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/signup': (context) => SignUpScreen(),
          '/createAccount': (context) => CreateAccountScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
