import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const QuantityButton({super.key, required this.onPressed, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade500
        )
      ),
      child: IconButton(
        onPressed: onPressed, 
        icon: Icon(icon)
      ),
    );
  }
}