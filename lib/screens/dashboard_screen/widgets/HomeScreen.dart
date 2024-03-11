import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:vixor_project/componenet/widgets/cat.dart';
import 'package:vixor_project/componenet/widgets/namewidget.dart';
import 'package:vixor_project/componenet/widgets/title%20widget.dart';
import 'package:vixor_project/const/app_constants.dart';
import 'package:vixor_project/services/chatservices/assets_manager.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsManager.hors,
          ),
        ),

        title: const AppNameTextWidget(fontSize: 20),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: size.height * 0.25,
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(50),
                  child: Swiper(
                    autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        AppConstants.bannersImages[index],
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: AppConstants.bannersImages.length,
                    pagination: const SwiperPagination(
                      // alignment: Alignment.center,
                      builder: DotSwiperPaginationBuilder(
                          activeColor: Colors.red, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const TitlesTextWidget(label: "Categories"),
              const SizedBox(
                height: 15.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics:const BouncingScrollPhysics(),
                itemCount:AppConstants.categoyList.length,
                itemBuilder: (context, index) {
                  return CategoryRoundedWidget(
                    image: AppConstants.categoyList[index].image,
                    name: AppConstants.categoyList[index].name,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Gap(20);
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}