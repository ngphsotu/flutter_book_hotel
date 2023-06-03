import 'package:flutter/material.dart';

class ReuseText extends StatefulWidget {
  final String text;
  final Color color;
  final double fontSize;
  final double? letterSpacing;
  final FontWeight? fontWeight;

  const ReuseText({
    super.key,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.letterSpacing,
    required this.text,
    required this.fontSize,
  });

  @override
  State<ReuseText> createState() => _ReuseTextState();
}

class _ReuseTextState extends State<ReuseText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        color: widget.color,
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight,
        letterSpacing: widget.letterSpacing,
      ),
    );
  }
}
