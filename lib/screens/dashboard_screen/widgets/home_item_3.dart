import 'package:flutter/material.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/bottom_sheet.dart';
import 'package:vixor_project/utils/app_imagse.dart';

class HomeItem3 extends StatelessWidget {
  const HomeItem3({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    Assets.imagesPeople,
                    fit: BoxFit.cover, // Ensure the image fills the container
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showBottomMySheet(
                    context,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(120, 141, 219, 225),
                        Color.fromARGB(120, 255, 255, 255),
                      ],
                      stops: [0.0, 0.5],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Join our Community',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        wordSpacing: 1,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'koulen',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
