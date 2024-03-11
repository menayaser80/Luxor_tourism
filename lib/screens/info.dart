

import 'package:flutter/material.dart';
import 'package:vixor_project/componenet/button.dart';
import 'package:vixor_project/componenet/custom_text_widget.dart';
import 'package:vixor_project/screens/auth/login_screen.dart';
import 'package:vixor_project/screens/auth/sign_up_screen.dart';
import 'package:vixor_project/utils/app_colors.dart';
import 'package:vixor_project/utils/app_imagse.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesLang),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            color: Colors.white.withOpacity(0.7),
            child: Container(
              margin: const EdgeInsets.fromLTRB(41, 198, 50, 206),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const AspectRatio(
                      aspectRatio: 4 / 2,
                      child: Image(
                        image: AssetImage(Assets.imagesLogo),
                        width: 100,
                        height: 100,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 3, 34),
                      child: const CustomTextWidget(
                        text: 'vixor',
                        color: AppColors.primaryColor,
                        fontSize: 20,
                      ),
                    ),
                    Button(
                        text: "Log in",
                        color: const Color(0xffffffff),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        }),
                    Button(
                        text: "Sign up",
                        color: const Color(0xffffffff),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()),
                          );
                        })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
