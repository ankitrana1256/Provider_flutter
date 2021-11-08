import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'auth_service.dart';
import 'wrapper.dart';
import 'loginscreen.dart';
import 'registerscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => const Wrapper(),
          "/login": (context) => const LoginScreen(),
          "/register": (context) => const RegisterScreen(),
        },
      ),
    );
  }
}
