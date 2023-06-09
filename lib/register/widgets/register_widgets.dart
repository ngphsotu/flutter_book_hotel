import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../register.dart';
import '/common/common.dart';

// * REGISTER WIDGETS

// * Build Appbar Widget in Register Page
AppBar appbarRegister(BuildContext context) {
  return AppBar(
    title: ReuseText(
      text: 'Register Account',
      color: AppColors.primary,
      fontSize: 20.sp,
    ),
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: AppColors.primary,
      ),
    ),
    elevation: 0,
    backgroundColor: AppColors.bg,
  );
}

// * Build Body Widget in Register Page
Widget bodyRegister(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        textRegister(),
        formRegister(context),
        buttonRegister(context),
      ],
    ),
  );
}

// * Build Text Widget in Login Page
Widget textRegister() {
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 50.h, bottom: 50.h),
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

// * Build Form Register Widget in Register Page
Widget formRegister(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 30.w, right: 30.w),
    child: Column(
      children: [
        ReuseTextFormField(
          onChanged: (value) {
            context.read<RegisterBloc>().add(UsernameEvent(username: value));
          },
          filled: true,
          hintText: 'Enter your username',
          labelText: 'User',
          fillColor: Colors.white,
          autocorrect: false,
          prefixIcon: Icon(Icons.person, size: 30.sp),
          keyboardType: TextInputType.multiline,
        ),
        SizedBox(height: 20.h),
        ReuseTextFormField(
          onChanged: (value) {
            context.read<RegisterBloc>().add(PhoneEvent(phone: value));
          },
          filled: true,
          hintText: 'Enter your phone',
          labelText: 'Phone',
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.phone, size: 30.sp),
          autocorrect: false,
          keyboardType: TextInputType.phone,
        ),
        SizedBox(height: 20.h),
        ReuseTextFormField(
          onChanged: (value) {
            context.read<RegisterBloc>().add(EmailEvent(email: value));
          },
          filled: true,
          hintText: 'Enter your email',
          labelText: 'Email',
          fillColor: Colors.white,
          autocorrect: false,
          prefixIcon: Icon(Icons.mail, size: 30.sp),
          keyboardType: TextInputType.multiline,
        ),
        SizedBox(height: 20.h),
        ReuseTextFormField(
          onChanged: (value) {
            context.read<RegisterBloc>().add(PasswordEvent(password: value));
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
        SizedBox(height: 20.h),
        ReuseTextFormField(
          onChanged: (value) {
            context
                .read<RegisterBloc>()
                .add(RePasswordEvent(repassword: value));
          },
          filled: true,
          hintText: 'Re-enter your password',
          labelText: 'Confirm Pass',
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.security_update, size: 30.sp),
          autocorrect: false,
          obscureText: true,
          keyboardType: TextInputType.multiline,
        ),
      ],
    ),
  );
}

// * Build Register Button Widget in Register Page
Widget buttonRegister(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 30.w, right: 30.w),
    child: Container(
      margin: EdgeInsets.only(top: 100.h),
      child: ReuseButton(
        onPressed: () {
          RegisterController(context: context).handleEmailSignUp();
          if (kDebugMode) {
            print('Press Register Button');
          }
        },
        textColor: Colors.white,
        buttonName: 'Register',
        backgroundColor: Colors.deepOrange[400],
      ),
    ),
  );
}
