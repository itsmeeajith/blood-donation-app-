import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location Page")),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('LAT: '),
              const Text('LNG: '),
              const Text('ADDRESS: '),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Get Current Location"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
