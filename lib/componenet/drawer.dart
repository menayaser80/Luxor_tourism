import 'package:flutter/material.dart';
import 'package:vixor_project/screens/luxor.dart';
import 'package:vixor_project/screens/more_about_sustainability.dart';
import 'package:vixor_project/utils/app_imagse.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesWall1),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            color: Colors.white.withOpacity(0.8),
          ),

          ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                  child: Text(
                'Menu',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff8E4F2E)),
              )),
              ListTile(
                title: const Text(
                  'More About Sustainability',
                  style: TextStyle(color: Color(0xff8E4F2E)),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Sustabilty()),
                  );
                  // Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Customize Trip',
                  style: TextStyle(color: Color(0xff8E4F2E)),
                ),
                onTap: () {
                  // Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'More About luxor',
                  style: TextStyle(color: Color(0xff8E4F2E)),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const luxor()),
                  );
                  // Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Green Places',
                  style: TextStyle(color: Color(0xff8E4F2E)),
                ),
                onTap: () {
                  // Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Historical Landmarks',
                  style: TextStyle(color: Color(0xff8E4F2E)),
                ),
                onTap: () {
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Contact Us',
                  style: TextStyle(color: Color(0xff8E4F2E)),
                ),
                onTap: () {
                  // Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Rate Us',
                  style: TextStyle(color: Color(0xff8E4F2E)),
                ),
                onTap: () {
                  // Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
