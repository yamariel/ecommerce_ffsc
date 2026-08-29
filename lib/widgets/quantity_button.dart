import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double width;
  final double heigth;
  const QuantityButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.heigth,
    required this.width
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade500),
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, size: 20),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
    );
  }
}
