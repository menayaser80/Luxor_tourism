import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const LinkText({super.key, 
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blue, // Customize link text color
          decoration: TextDecoration.underline, // Add underline to text
        ),
      ),
    );
  }
}
