import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common.dart';

class ReuseButton extends StatefulWidget {
  final String buttonName;
  final Color textColor;
  final Color? backgroundColor;
  final Function() onPressed;

  const ReuseButton({
    super.key,
    required this.onPressed,
    required this.textColor,
    required this.buttonName,
    this.backgroundColor = AppColors.primary,
  });

  @override
  State<ReuseButton> createState() => _ReuseButtonState();
}

class _ReuseButtonState extends State<ReuseButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 150.w,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(width: 1.w, color: Colors.grey),
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: widget.backgroundColor,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.h),
          ),
        ),
        child: ReuseText(
          text: widget.buttonName,
          color: widget.textColor,
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
