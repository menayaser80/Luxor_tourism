
import 'package:flutter/material.dart';
import 'package:vixor_project/componenet/custom_text_widget.dart';
import 'package:vixor_project/models/list_item_model.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/ItemList2.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/home_item_3.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/home_list.dart';
import 'package:vixor_project/utils/app_colors.dart';
import 'package:vixor_project/utils/app_imagse.dart';

import 'widgets/home_item_list_1.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<ListItemModel> itemModel = [
    ListItemModel(image: Assets.imagesWall1, text: 'karnak '),
    ListItemModel(image: Assets.imagesWall1, text: 'karnak temple'),
    ListItemModel(image: Assets.imagesWall1, text: 'karnak temple')
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.imagesLang,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Container(
            decoration: BoxDecoration(color: AppColors.white.withOpacity(0.7))),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.7,
              height: MediaQuery.sizeOf(context).width * 0.2,
              decoration: BoxDecoration(
                  color: AppColors.blue.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(16)),
              child: const Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(text: 'welcom back', color: Colors.white),
                  CustomTextWidget(text: 'user name', color: Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const ItemList1(),
            const SizedBox(height: 15),
            const ItemList2(),
            // Expanded(
            //   child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       shrinkWrap: true,
            //       itemBuilder: (context, index) => Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: ItemList(item: itemModel[index]),
            //           ),
            //       itemCount: itemModel.length),
            // ),
            const Row(
              children: [
                HomeItem3(),
                HomeItem3(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      ],
    );
  }
}
