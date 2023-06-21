import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../global.dart';
import '../welcome.dart';
import '/common/common.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return BlocBuilder<WelcomeBloc, WelcomeState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 200.w,
                  height: 200.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/images/logo2.png'),
                    ),
                  ),
                ),
              ),
              ReuseButton(
                onPressed: () {
                  Global.storageService.setBool(
                      AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
                  navigator.pushNamedAndRemoveUntil(
                      AppRoutes.LOGIN, (route) => false);
                },
                buttonName: 'Next',
                textColor: Colors.black,
              ),
            ],
          ),
        );
      },
    );
  }
}
