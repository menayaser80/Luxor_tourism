
import 'package:flutter/material.dart';
import 'package:vixor_project/componenet/custom_text_widget.dart';
import 'package:vixor_project/componenet/drawer.dart';
import 'package:vixor_project/componenet/my_app_bar.dart';
import 'package:vixor_project/utils/app_colors.dart';
import 'package:vixor_project/utils/app_imagse.dart';

class Sustabilty extends StatelessWidget {
  const Sustabilty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Myappbar(),
        drawer: const Mydrawer(),
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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomTextWidget(
                                  text: "More About",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.left,
                                ),
                                const CustomTextWidget(
                                  text: "Sustainability ",
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xffC78800),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20.0),
                                      topLeft: Radius.zero,
                                      bottomRight: Radius.circular(20.0),
                                      bottomLeft: Radius.zero,
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CustomTextWidget(
                                      text: 'Introduction',
                                      fontSize: 32,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * .5,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CustomTextWidget(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        text:
                                            "Sustainability has become a pivotal concern in the global context, transcending various industries. In recent years, the tourism sector has witnessed a paradigm shift towards responsible and sustainable practices.As the world seeks ways to minimize its environmental footprint, Egypt is also embracing the concept of sustainable tourism to safeguard its rich cultural and natural heritage. "),
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xffC78800),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20.0),
                                      topLeft: Radius.zero,
                                      bottomRight: Radius.circular(20.0),
                                      bottomLeft: Radius.zero,
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        SizedBox(
                            width: MediaQuery.sizeOf(context).width * .5,
                            child:
                                const Image(image: AssetImage(Assets.forest))),
                      ],
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffC78800),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.zero,
                          bottomRight: Radius.circular(20.0),
                          bottomLeft: Radius.zero,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomTextWidget(
                          text: 'Importance',
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomTextWidget(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            text:
                                "1)Environmental Conservation:\n Egypt, with its ancient wonders and natural beauty,  is taking steps to protect its ecosystems. Initiatives include wildlife conservation, waste management, and sustainable energy practices in tourist facilities.\n2)Cultural Preservation:\n  Preserving Egypt's rich cultural heritage is crucial for sustainable tourism. This involves responsible tourism practices, respectful behavior towards cultural sites, and initiatives to empower local communities. \n 3)Community Engagement:\n Involving local communities in the tourism industry fosters economic growth and social development. Empowering residents through job opportunities, training, and community-based tourism initiatives ensures that the benefits of tourism are shared equitably."),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffC78800),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.zero,
                          bottomRight: Radius.circular(20.0),
                          bottomLeft: Radius.zero,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomTextWidget(
                          text: 'Sustainable Tourism in Egypt',
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomTextWidget(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.left,
                            text:
                                "1)Environmental Conservation:\n Egypt, with its ancient wonders and natural beauty,  is taking steps to protect its ecosystems. Initiatives include wildlife conservation, waste management, and sustainable energy practices in tourist facilities.\n2)Cultural Preservation:\n  Preserving Egypt's rich cultural heritage is crucial for sustainable tourism. This involves responsible tourism practices, respectful behavior towards cultural sites, and initiatives to empower local communities. \n 3)Community Engagement:\n Involving local communities in the tourism industry fosters economic growth and social development. Empowering residents through job opportunities, training, and community-based tourism initiatives ensures that the benefits of tourism are shared equitably."),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
