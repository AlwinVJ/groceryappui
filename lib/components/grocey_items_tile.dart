import 'package:flutter/material.dart';

class GroceryItemsTile extends StatefulWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

  GroceryItemsTile(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.imagePath,
      required this.color,
      required this.onPressed});

  @override
  State<GroceryItemsTile> createState() => _GroceryItemsTileState();
}

class _GroceryItemsTileState extends State<GroceryItemsTile> {
  final String buttonText = 'Add to Cart';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          decoration: BoxDecoration(
              color: widget.color[100],
              borderRadius: BorderRadius.circular(12.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                widget.imagePath,
                height: 64,
              ),
              Text(widget.itemName),
              Text(
                widget.itemPrice,
                style: TextStyle(
                    color: widget.color[700], fontWeight: FontWeight.w600),
              ),
              MaterialButton(
                onPressed: widget.onPressed,
                color: widget.color[800],
                child: Text(
                  buttonText,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
    );
  }
}
