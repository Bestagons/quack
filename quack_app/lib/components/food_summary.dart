import 'package:flutter/material.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/screens/homepage/item_screen.dart';
import 'package:quack_app/core/food/food_item.dart';
import 'package:auto_size_text/auto_size_text.dart';

// Reuseable FoodSummary
class FoodSummary extends StatefulWidget {
  final FoodItem item;
  final AutoSizeGroup group;
  final Function() onFavoritePressed;
  const FoodSummary(
      {Key? key,
      required this.item,
      required this.group,
      required this.onFavoritePressed})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _FoodSummaryState();
}

// Implements the FoodSummary State
class _FoodSummaryState extends State<FoodSummary> {
  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ItemScreen(item: widget.item);
          }));
        },
        title: AutoSizeText(widget.item.getName(),
            style: const TextStyle(color: Colors.black, fontSize: 25),
            group: widget.group,
            maxFontSize: 25,
            maxLines: 1),
        trailing: IconButton(
            icon: widget.item.isFavorite()
                ? const Icon(Constants.kFavorited,
                    color: Constants.kFavoritedColor)
                : const Icon(Constants.kFavorite),
            iconSize: 30,
            splashRadius: 0.01,
            onPressed: () {
              setState(() {
                debugPrint("On press executed");
                widget.item.toggleFavorite().then((_) => {
                  widget.onFavoritePressed()
                });
              });
            }),
      )),
    ]);
  }
}
