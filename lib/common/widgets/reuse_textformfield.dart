import 'package:flutter/material.dart';

class ReuseTextFormField extends StatefulWidget {
  final int? maxLines;
  final bool obscureText;
  final bool autocorrect;
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
        hintText: widget.hintText,
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,

        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),

        // focusedErrorBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(color: Colors.grey),
        //   borderRadius: BorderRadius.circular(10),
        // ),

        // enabledBorder:OutlineInputBorder(
        //   borderSide: const BorderSide(color: Colors.grey),
        //   borderRadius: BorderRadius.circular(10),
        // ),

        // disabledBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(color: Colors.grey),
        //   borderRadius: BorderRadius.circular(10),
        // ),

        // errorBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(color: Colors.grey),
        //   borderRadius: BorderRadius.circular(10),
        // ),
      ),
    );
  }
}
