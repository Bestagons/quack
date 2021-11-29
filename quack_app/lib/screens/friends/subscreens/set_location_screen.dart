import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_pixels/image_pixels.dart';
import 'package:quack_app/core/seating/seating_locations.dart';
import 'package:quack_app/core/user/user.dart';

// RafaelPiloto10:
//Cannot be tested (https://flutter.dev/docs/release/breaking-changes/rendereditable-layout-before-hit-test)

class SetLocationScreen extends StatefulWidget {
  const SetLocationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SetLocationScreenState();
}

class SetLocationScreenState extends State<SetLocationScreen> {
  @override
  void initState() {
    // Re-cache updated values on view
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Image image = Image.asset("assets/dct_seating_locs.png");
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Expanded(
                flex: 4,
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Share Location"),
                )),
            Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon((User().userData.isSharingLoc())
                        ? Icons.location_on
                        : Icons.location_off),
                    iconSize: 30,
                    color: (User().userData.isSharingLoc())
                        ? Colors.blue
                        : Colors.blue[700],
                    onPressed: () {
                      setState(() {
                        User().userData.toggleShareLoc();
                      });
                    },
                  ),
                )),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.topCenter,
            child: AutoSizeText(
              "Currently ${User().userData.isSharingLoc() ? 'sharing' : 'not sharing'}: ${User().userData.getSeatingLocString()}",
              maxFontSize: 40,
              minFontSize: 20,
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                      child: ImagePixels(
                    imageProvider: image.image,
                    builder: (context, img) => GestureDetector(
                      onTapUp: (TapUpDetails details) {
                        int x = details.localPosition.dx.toInt() * 3;
                        int y = details.localPosition.dy.toInt() * 3;
                        Color c = img.pixelColorAt!(x, y);
                        SeatingLocation s = SeatingLocation.none_0.fromColor(c);
                        if (s != SeatingLocation.none_0) {
                          User().userData.setSeatingLoc(s);
                          Navigator.pop(context);
                        }
                      },
                      child: image,
                    ),
                  ))))
        ],
      ),
    );
  }
}
