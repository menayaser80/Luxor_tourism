import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:vixor_project/componenet/widgets/subtitle_text.dart';
import 'package:vixor_project/componenet/widgets/title%20widget.dart';
import 'package:vixor_project/provider/homeprovider.dart';
import 'package:vixor_project/provider/trip%20provider.dart';


class CartBottomSheetWidget extends StatelessWidget {
  const CartBottomSheetWidget({super.key, required this.function});
  final Function function;
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<HomeProvider>(context);
    final cartProvider = Provider.of<TripProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: const Border(
          top: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: kBottomNavigationBarHeight + 10,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: Container(
                  height: 40.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.red
                  ),
                  child: InkWell(
                      onTap: ()async{
                        await function();
                      },
                      child: Center(
                        child: const Text("confirmTrip",style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}