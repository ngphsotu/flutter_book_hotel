import 'package:flutter/material.dart';

import '../../global.dart';
import '/common/common.dart';

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
              Global.storageService
                  .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(AppRoutes.LOGIN, (route) => false);
            },
            buttonName: 'Next',
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
