import 'package:flutter/material.dart';

class Checkboxbut extends StatefulWidget {
  const Checkboxbut({super.key});

  @override
  State<Checkboxbut> createState() => _CheckboxbutState();
}

class _CheckboxbutState extends State<Checkboxbut> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        );
  }
}