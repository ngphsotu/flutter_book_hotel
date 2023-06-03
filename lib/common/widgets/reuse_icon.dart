import 'package:flutter/material.dart';

class ReuseIcon extends StatefulWidget {
  final IconData icon;
  final double size;
  final Color color;

  const ReuseIcon({
    super.key,
    required this.icon,
    this.size = 30,
    this.color = Colors.black,
  });

  @override
  State<ReuseIcon> createState() => _ReuseIconState();
}

class _ReuseIconState extends State<ReuseIcon> {
  @override
  Widget build(BuildContext context) {
    return Icon(widget.icon, size: widget.size, color: widget.color);
  }
}
