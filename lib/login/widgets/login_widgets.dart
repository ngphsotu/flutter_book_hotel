import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../login.dart';
import '/common/common.dart';

// * LOGIN WIDGETS

// * Build Appbar Widget in Login Page
AppBar appbarLogin() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
  );
}

// * Build Body Widget in Login Page
Widget bodyLogin(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        textLogin(),
        formLogin(context),
        buttonLogin(context),
      ],
    ),
  );
}

// * Build Text Widget in Login Page
Widget textLogin() {
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 100.h, bottom: 100.h),
      child: Text(
        'Booking Hotels',
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 40.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
    ),
  );
}

// * Build Form Login Widget in Login Page
Widget formLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 30.w, right: 30.w),
    child: Column(
      children: [
        ReuseTextFormField(
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailEvent(email: value));
          },
          hintText: 'Enter your email',
          labelText: 'Email',
          autocorrect: false,
          prefixIcon: const Icon(Icons.person, color: AppColors.primaryColor),
          keyboardType: TextInputType.multiline,
        ),
        SizedBox(height: 20.h),
        ReuseTextFormField(
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordEvent(password: value));
          },
          hintText: 'Enter your password',
          labelText: 'Password',
          prefixIcon: const Icon(Icons.security, color: AppColors.primaryColor),
          autocorrect: false,
          obscureText: true,
          keyboardType: TextInputType.multiline,
        ),
      ],
    ),
  );
}

// * Build Form Login Widget in Login Page
Widget buttonLogin(context) {
  final navigator = Navigator.of(context);
  return Container(
    margin: EdgeInsets.only(left: 30.w, right: 30.w),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 100.h),
          child: ReuseButton(
            onPressed: () {
              LoginController(context: context).handleEmailSignIn('email');
              if (kDebugMode) {
                print('Press Login Button');
              }
            },
            textColor: Colors.white,
            buttonName: 'Login',
            backgroundColor: Colors.deepOrange[400],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
          child: Text(
            'or',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15.sp,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 0.h),
          child: ReuseButton(
            onPressed: () {
              navigator.pushNamed(AppRoutes.REGISTER);
              if (kDebugMode) {
                print('Press Register Button');
              }
            },
            textColor: Colors.grey[500],
            buttonName: 'Register',
          ),
        ),
      ],
    ),
  );
}
