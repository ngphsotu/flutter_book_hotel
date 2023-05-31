import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseButton extends StatefulWidget {
  final String buttonName;
  final Color? textColor;
  final Color? backgroundColor;
  final Function() onPressed;

  const ReuseButton({
    super.key,
    this.textColor,
    this.backgroundColor,
    required this.buttonName,
    required this.onPressed,
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
        ),
        child: Text(
          widget.buttonName,
          style: TextStyle(
            color: widget.textColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
