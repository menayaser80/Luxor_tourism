import 'package:flutter/material.dart';

Future<dynamic> showBottomMySheet(context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: const Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'join our Community',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  wordSpacing: 1,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'koulen',
                  color: Color.fromARGB(250, 142, 80, 46),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Join us today on your favorite social media apps and let\'s embark on a journey towards greener, more responsible travel together!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  wordSpacing: 1,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Oxanium',
                  color: Color.fromARGB(250, 142, 80, 46),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: const Icon(
                  //       FontAwesomeIcons.facebook,
                  //       size: 60,
                  //       color: Color.fromARGB(250, 142, 80, 46),
                  //     )),
                  SizedBox(
                    width: 10,
                  ),
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: const Icon(
                  //       FontAwesomeIcons.instagram,
                  //       size: 60,
                  //       color: Color.fromARGB(250, 142, 80, 46),
                  //     ))
                ],
              )
            ],
          )),
        );
      });
}
