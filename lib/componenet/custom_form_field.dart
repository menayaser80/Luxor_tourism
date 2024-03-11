import 'package:flutter/material.dart';
import 'package:vixor_project/utils/app_colors.dart';

class MyCustomTextField extends StatelessWidget {
  final String labelText;
  final Function(String)? onChanged;

  const MyCustomTextField({
    super.key,
    required this.labelText,
    this.onChanged, required TextEditingController controller,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: AppColors.brown),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
