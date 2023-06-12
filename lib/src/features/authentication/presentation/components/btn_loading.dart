import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BtnLoading extends StatelessWidget {
  final Function()? onTap;
  final String label;
  final bool isLoading;
  final Color color;
  final EdgeInsetsGeometry? margin;

  const BtnLoading({
    super.key,
    required this.onTap,
    this.label = 'Entrar',
    this.isLoading = false,
    this.color = Colors.black,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final child = Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: isLoading
              ? const CupertinoActivityIndicator(
                  color: Colors.white,
                )
              : child,
        ),
      ),
    );
  }
}
