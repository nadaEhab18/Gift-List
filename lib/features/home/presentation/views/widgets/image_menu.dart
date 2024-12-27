import 'package:depi_gift_list/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ImageMenu extends StatelessWidget {
  const ImageMenu({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsData.menuImage,
      height: screenHeight * 0.09,
      width: screenWidth * 0.09,
      color: Colors.black87,
    );
  }
}
