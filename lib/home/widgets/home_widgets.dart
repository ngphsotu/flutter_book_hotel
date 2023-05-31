import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/common/common.dart';

// * HOME WIDGETS

// * Build Appbar Widget in Home Page
AppBar appbarHome(context, navigator, function) {
  return AppBar(
    leading: user(),
    elevation: 0,
    centerTitle: true,
    backgroundColor: AppColors.lightgrey,
    actions: [logout(context, navigator, function), SizedBox(width: 10.w)],
  );
}

// * Build Body Widget in Home Page
Widget bodyHome() {
  return SingleChildScrollView(
    child: Column(
      children: [
        search(),
        infofindroom(),
        Container(
          margin: EdgeInsets.only(top: 20.h),
          child: ReuseButton(
            buttonName: 'Search for'.toUpperCase(),
            onPressed: () {
              if (kDebugMode) {
                print('Press Search For Button');
              }
            },
          ),
        )
      ],
    ),
  );
}

// * Build User Widget in Home Page
Widget user() {
  return GestureDetector(
    onTap: () {
      if (kDebugMode) {
        print('Tap Profile User');
      }
    },
    child: Icon(
      Icons.person,
      size: 40.sp,
      color: AppColors.primaryColor,
    ),
  );
}

// * Build Logout Widget in Home Page
Widget logout(
    BuildContext context, NavigatorState navigator, Function()? function) {
  return GestureDetector(
    onTap: () {
      if (kDebugMode) {
        print('Tapped Logout');
      }
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Confirm Logout'),
            content: const Text('Are you sure ?'),
            actions: [
              TextButton(
                onPressed: () {
                  navigator.pop();
                  if (kDebugMode) {
                    print('Pressed Cancel Logout Text Button');
                  }
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: function,
                child: const Text('Confirm'),
              ),
            ],
          );
        },
      );
    },
    child: Icon(Icons.logout, size: 40.sp, color: AppColors.primaryColor),
  );
}

// * Build Search Widget in Home Page
Widget search() {
  return Container(
    margin: EdgeInsets.only(top: 10.h, left: 30.w, right: 30.w),
    child: ReuseTextFormField(
      filled: true,
      fillColor: Colors.white,
      hintText: 'Search something ?',
      labelText: 'Search',
      suffixIcon: Icon(Icons.search, size: 30.sp),
    ),
  );
}

// * Build Info Room Widget in Home Page
Widget infofindroom() {
  return Container(
    width: double.infinity,
    height: 342.h,
    margin: EdgeInsets.only(top: 200.h, left: 20.w, right: 20.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.h),
    ),
    child: Container(
      margin: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w, bottom: 10.h),
      child: Column(
        children: [
          ReuseTextFormField(
            filled: true,
            hintText: 'Where is Your Location ?',
            prefixIcon: Icon(Icons.room, size: 30.sp),
          ),
          SizedBox(height: 10.h),
          ReuseTextFormField(
            filled: true,
            hintText: 'Check In - Check Out',
            prefixIcon: Icon(Icons.calendar_today, size: 30.sp),
          ),
          SizedBox(height: 10.h),
          ReuseTextFormField(
            filled: true,
            hintText: 'How many rooms ?',
            prefixIcon: Icon(Icons.home_work, size: 30.sp),
          ),
          SizedBox(height: 10.h),
          ReuseTextFormField(
            filled: true,
            hintText: 'How many adults ?',
            prefixIcon: Icon(Icons.people, size: 30.sp),
          ),
          SizedBox(height: 10.h),
          ReuseTextFormField(
            filled: true,
            hintText: 'How many child?',
            prefixIcon: Icon(Icons.child_care, size: 30.sp),
          ),
        ],
      ),
    ),
  );
}
