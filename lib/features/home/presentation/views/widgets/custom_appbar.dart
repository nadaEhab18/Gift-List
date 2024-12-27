import 'package:depi_gift_list/features/home/presentation/views/widgets/image_menu.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageMenu(screenHeight: screenHeight, screenWidth: screenWidth),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: 'Search',
              suffixIcon: const Icon(
                Icons.search_outlined,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
