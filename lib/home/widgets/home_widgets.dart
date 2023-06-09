import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/common/common.dart';

// * HOME WIDGETS

// * Build Appbar Widget in Home Page
AppBar appbarHome(context, navigator, function) {
  return AppBar(
    leading: user(navigator),
    elevation: 0,
    centerTitle: true,
    backgroundColor: AppColors.bg,
    actions: [logout(context, navigator, function), SizedBox(width: 10.w)],
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
    child: Icon(Icons.logout, size: 40.sp, color: AppColors.primary),
  );
}

// * Build User Widget in Home Page
Widget user(NavigatorState navigator) {
  return GestureDetector(
    onTap: () {
      navigator.pushNamed(AppRoutes.PROFILE);
      if (kDebugMode) {
        print('Tap Profile User');
      }
    },
    child: Icon(
      Icons.account_circle,
      size: 40.sp,
      color: AppColors.primary,
    ),
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

// * Build Search Button Widget in Home Page
Widget searchButton() {
  return Container(
    margin: EdgeInsets.only(top: 20.h),
    child: ReuseButton(
      textColor: Colors.white,
      buttonName: 'Search for'.toUpperCase(),
      onPressed: () {
        if (kDebugMode) {
          print('Press Search For Button');
        }
      },
    ),
  );
}
