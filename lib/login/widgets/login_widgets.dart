import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../login.dart';
import '/common/common.dart';

// * LOGIN WIDGETS

// * Build Appbar Widget in Login Page
AppBar appbarLogin() {
  return AppBar(elevation: 0, backgroundColor: AppColors.bg);
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
      child: ReuseText(
        text: 'Booking Hotels',
        color: AppColors.primary,
        fontSize: 40.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
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
          filled: true,
          hintText: 'Enter your email',
          labelText: 'Email',
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.person, size: 30.sp),
          autocorrect: false,
          keyboardType: TextInputType.multiline,
        ),
        SizedBox(height: 20.h),
        ReuseTextFormField(
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordEvent(password: value));
          },
          filled: true,
          hintText: 'Enter your password',
          labelText: 'Pass',
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.security, size: 30.sp),
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
            textColor: Colors.white,
            buttonName: 'Login',
            onPressed: () {
              LoginController(context: context).handleEmailSignIn('email');
              if (kDebugMode) {
                print('Press Login Button');
              }
            },
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
            textColor: Colors.grey,
            buttonName: 'Register',
            backgroundColor: Colors.white,
            onPressed: () {
              navigator.pushNamed(AppRoutes.REGISTER);
              if (kDebugMode) {
                print('Press Register Button');
              }
            },
          ),
        ),
      ],
    ),
  );
}
