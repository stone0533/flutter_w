import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension WImage on Image {
  //  package:google_maps_flutter_platform_interface/src/types/bitmap.dart
  // Future<BitmapDescriptor> loadIcon() async {
  //   String assetPath = 'assets/images/map_address_icon.png';
  //   ByteData bytes = await rootBundle.load(assetPath);
  //   return BitmapDescriptor.bytes(bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes),
  //       imagePixelRatio: 2.5);
  // }

  static void imagePreload({List<String>? images}) {
    if (Get.context != null) {
      images?.forEach((element) {
        precacheImage(AssetImage(element), Get.context!);
      });
    }
  }
}
