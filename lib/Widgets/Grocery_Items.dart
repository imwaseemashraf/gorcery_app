import 'package:flutter/material.dart';

class GroceryItemsTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemPth;
  final color;
  void Function()? onPressed;
  GroceryItemsTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.itemPth,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (color),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            color: color,
            child: Image.asset(
              itemPth,
              height: 100,
            ),
          ),
          SizedBox(height: 10),
          Text(itemName),
          MaterialButton(
            onPressed: onPressed,
            color: color[700],
            child: Text("\$" + itemPrice),
          ),
        ],
      ),
    );
  }
}
