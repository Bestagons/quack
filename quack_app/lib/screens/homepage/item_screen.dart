import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:quack_app/core/food/food_item.dart';

class ItemScreen extends StatelessWidget {
  final FoodItem item;

  const ItemScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          item.getName(),
          overflow: TextOverflow.ellipsis,
        )),
        body: Column(children: [
          const SizedBox(height: 25),
          Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              padding: const EdgeInsets.all(10),
              height: 60,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.amber),
              child: Center(
                  child: AutoSizeText(
                item.getName(),
                style: const TextStyle(fontSize: 38),
                maxLines: 1,
              ))),
          const SizedBox(height: 25),
          Column(children: [
            const AutoSizeText(
              "Rating:",
              style: TextStyle(fontSize: 30),
              maxFontSize: 30,
            ),
            RatingBar.builder(
              ignoreGestures: true,
              initialRating: item.getRating().toDouble(),
              direction: Axis.horizontal,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},
            ),
          ]),
          const SizedBox(height: 25),
          Column(children: [
            const AutoSizeText(
              "Your Rating:",
              style: TextStyle(fontSize: 30),
              maxFontSize: 30,
            ),
            RatingBar.builder(
              glow: true,
              initialRating: item.getUserRating().toDouble(),
              direction: Axis.horizontal,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                item.setUserRating(rating.toInt());
              },
            )
          ]),
        ]));
  }
}
