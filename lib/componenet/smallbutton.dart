import 'package:flutter/material.dart';

class Smallbutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  const Smallbutton(
      {super.key,
      required this.text,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff9f6b4f)),
        borderRadius: BorderRadius.circular(32),
      ),
      margin: const EdgeInsets.fromLTRB(0, 14, 0, 20),
      width: MediaQuery.sizeOf(context).width * .35,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color.withOpacity(0.7),
        ),
        child: Text(text,
            style: const TextStyle(color: Colors.black, fontSize: 20)),
      ),
    );
  }
}
