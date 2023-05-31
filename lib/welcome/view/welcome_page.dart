import 'package:flutter/material.dart';
import 'package:flutter_book_hotel/common/common.dart';

import '../../login/login.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Welcome Page'),
          ),
          ReuseButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            buttonName: 'Next',
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
