import 'package:flutter/material.dart';

class CustomConstraints extends StatelessWidget {
  const CustomConstraints({
    super.key,
    required this.backgroundColor,
    required this.child,
    required this.maxWidth,
  });

  final Color backgroundColor;
  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: child,
        ),
      ),
    );
  }
}
