import 'package:flutter/material.dart';
import 'package:flutter_book_hotel/common/value/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseTextFormField extends StatefulWidget {
  final int? maxLines;
  final bool? filled;
  final bool obscureText;
  final bool autocorrect;
  final Color? fillColor;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final Function(String value)? onChanged;

  const ReuseTextFormField({
    super.key,
    this.maxLines = 1,
    this.autocorrect = true,
    this.obscureText = false,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.onChanged,
    this.fillColor = AppColors.lightgrey,
    this.filled = false,
  });

  @override
  State<ReuseTextFormField> createState() => _ReuseTextFormFieldState();
}

class _ReuseTextFormFieldState extends State<ReuseTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      onChanged: (value) => widget.onChanged!(value),
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        filled: widget.filled,
        hintText: widget.hintText,
        fillColor: widget.fillColor,
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.h),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.h),
        ),

        // focusedErrorBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(color: Colors.grey),
        //   borderRadius: BorderRadius.circular(10.h),
        // ),
        // enabledBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(color: Colors.grey),
        //   borderRadius: BorderRadius.circular(10.h),
        // ),
        // disabledBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(color: Colors.grey),
        //   borderRadius: BorderRadius.circular(10.h),
        // ),
        // errorBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(color: Colors.grey),
        //   borderRadius: BorderRadius.circular(10.h),
        // ),
      ),
    );
  }
}
