import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();

    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: email,
              decoration: const InputDecoration(labelText: "Email"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: password,
              decoration: const InputDecoration(labelText: "Password"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              authService.signInWithEmailAndPassword(email.text, password.text);
            },
            child: const Text("Login"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: const Text("Register"),
          ),
        ],
      ),
    );
  }
}
