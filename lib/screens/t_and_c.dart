
import 'package:flutter/material.dart';
import 'package:vixor_project/componenet/custom_text_widget.dart';
import 'package:vixor_project/utils/app_colors.dart';

class Tc extends StatelessWidget {
  const Tc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: const Color(0xffffffff),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const CustomTextWidget(
                  text: 'Terms and conditions',
                  fontSize: 35,
                  fontWeight: FontWeight.w400,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * .5,
                  color: const Color.fromARGB(255, 214, 214, 214),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: "Terms",
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: AppColors.brown,
                        ),
                        CustomTextWidget(text: " 'Lorem ipsum dolor sit amet, ")
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  color: const Color.fromARGB(255, 214, 214, 214),
                  height: MediaQuery.sizeOf(context).height * .5,
                  width: double.infinity,
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: 'Condition',
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: AppColors.brown,
                        ),
                        CustomTextWidget(text: " 'Lorem ipsum dolor sit amet,"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
