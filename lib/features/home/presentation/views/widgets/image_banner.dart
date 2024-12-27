import 'package:depi_gift_list/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  const ImageBanner({
    super.key, required this.screenHeight, required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.3,
      width: screenWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          AssetsData.bannerImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
