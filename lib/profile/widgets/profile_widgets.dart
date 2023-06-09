import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/common/common.dart';

// * PROFILE WIDGETS

// * Build Appbar Widget in Profile Page
AppBar appbarProfile(context) {
  return AppBar(
    title: Text(
      'Profile',
      style: TextStyle(color: AppColors.bg, fontSize: 20.sp),
    ),
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: AppColors.bg,
      ),
    ),
    elevation: 0,
    backgroundColor: AppColors.primary,
  );
}

// * Build Body Widget in Profile Page
Widget bodyProfile() {
  return Container(
    width: double.infinity,
    height: 600.h,
    margin: EdgeInsets.only(top: 150.h),
    decoration: BoxDecoration(
      color: AppColors.bg,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.h),
        topRight: Radius.circular(30.h),
      ),
    ),
    child: Container(
      margin: EdgeInsets.only(top: 200.h, left: 50.w, right: 50.w),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (kDebugMode) {
                print('Tap Dark / Light');
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const ReuseIcon(icon: Icons.dark_mode),
                    SizedBox(width: 20.w),
                    ReuseText(text: 'Dark / Light', fontSize: 18.sp),
                  ],
                ),
                ReuseIcon(icon: Icons.arrow_forward_ios, size: 20.sp),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          GestureDetector(
            onTap: () {
              if (kDebugMode) {
                print('Tap Manage Account');
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const ReuseIcon(icon: Icons.account_circle),
                    SizedBox(width: 20.w),
                    ReuseText(text: 'Manage Account', fontSize: 18.sp),
                  ],
                ),
                ReuseIcon(icon: Icons.arrow_forward_ios, size: 20.sp),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          GestureDetector(
            onTap: () {
              if (kDebugMode) {
                print('Tap Manage Home Stay');
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const ReuseIcon(icon: Icons.home),
                    SizedBox(width: 20.w),
                    ReuseText(text: 'Manage Home Stay', fontSize: 18.sp),
                  ],
                ),
                ReuseIcon(icon: Icons.arrow_forward_ios, size: 20.sp),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          GestureDetector(
            onTap: () {
              if (kDebugMode) {
                print('Tap Manage Transaction');
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const ReuseIcon(icon: Icons.telegram_outlined),
                    SizedBox(width: 20.w),
                    ReuseText(text: 'Manage Transaction', fontSize: 18.sp),
                  ],
                ),
                ReuseIcon(icon: Icons.arrow_forward_ios, size: 20.sp),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
