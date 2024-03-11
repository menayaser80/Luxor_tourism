
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vixor_project/componenet/custom_text_widget.dart';
import 'package:vixor_project/const/reusable.dart';
import 'package:vixor_project/screens/info.dart';
import 'package:vixor_project/screens/localization/changelocal.dart';
import 'package:vixor_project/utils/app_colors.dart';
import 'package:vixor_project/utils/app_imagse.dart';

class Lang extends GetView<LocaleController> {
  const Lang({super.key});

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
                          fontSize: 86,
                          color: AppColors.primaryColor,
                        )),
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 84, 0),
                        child:  Text(
                          "Select Language",
                          style: TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),

                        )),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 59),
                      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                      width: double.infinity,
                      height: 62,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff9f6b4f)),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: "English",
                        items: const [
                          DropdownMenuItem(
                            value: 'English',
                            child: Text(
                              'English',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Ar',
                            child: CustomTextWidget(text: 'Arabic'),
                          ),
                        ],
                        onChanged: (String? value) {
                          if (value == 'English') {
                            controller.changeLang("en");
                           navigateTo(context, Info());
                          } else if (value == 'Ar') {
                            controller.changeLang("ar");
                            navigateTo(context, Info());
                          }
                        },
                      ),
                    )
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
