import 'package:flutter/material.dart';
import 'package:vixor_project/utils/app_imagse.dart';

class Myappbar extends StatelessWidget implements PreferredSizeWidget {
  // ignore: use_key_in_widget_constructors
  const Myappbar({Key? key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
   
      title: const Center(
        child: Text(
          'Vixor',
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w400,
              height: 0.5,
              //color: Color(0xffffffff),
              color: Color(0xff8E4F2E)),
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Image(image: AssetImage(Assets.imagesLogo)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
