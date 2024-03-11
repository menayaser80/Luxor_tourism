
import 'package:flutter/material.dart';
import 'package:vixor_project/models/list_item_model.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key, required this.item});
  final ListItemModel item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(200, 33, 126, 180), width: 5),
                color: const Color.fromARGB(100, 33, 126, 180),
                borderRadius: BorderRadius.circular(25)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                height: 120,
                width: 180,
                image: AssetImage(item.image),
                fit: BoxFit.cover,
              ),
            )),
        Text(
            item.text,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w900,
              fontFamily: 'Oxanium',
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1
                ..color = Colors.white,
            )),
      ],
    );
  }
}
