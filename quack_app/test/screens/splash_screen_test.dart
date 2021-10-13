import 'dart:io';
import 'package:flutter_test/flutter_test.dart';

var assetPaths = [
  'android/app/src/main/res/drawable-hdpi/splash.png',
  'android/app/src/main/res/drawable-mdpi/splash.png',
  'android/app/src/main/res/drawable-v21/background.png',
  'android/app/src/main/res/drawable-xhdpi/splash.png',
  'android/app/src/main/res/drawable-xxhdpi/splash.png',
  'android/app/src/main/res/drawable-xxxhdpi/splash.png',
  'android/app/src/main/res/drawable/background.png',
  'ios/Runner/Assets.xcassets/LaunchBackground.imageset/background.png',
  'ios/Runner/Assets.xcassets/LaunchImage.imageset/LaunchImage.png',
  'ios/Runner/Assets.xcassets/LaunchImage.imageset/LaunchImage@2x.png',
  'ios/Runner/Assets.xcassets/LaunchImage.imageset/LaunchImage@3x.png'
];

bool checkPath(String path) {
  return File(path).existsSync();
}

void main() {
  group("splash test", () {
      for(var assetPath in assetPaths) {
            test(assetPath, () {
                   expect(checkPath(assetPath), true);     
            });
      }
  });
}