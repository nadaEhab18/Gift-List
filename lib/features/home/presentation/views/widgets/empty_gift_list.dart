import 'package:depi_gift_list/core/utils/styles.dart';
import 'package:flutter/material.dart';

class EmptyGiftList extends StatelessWidget {
  const EmptyGiftList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.card_giftcard, size: 100, color: Colors.grey),
          const SizedBox(height: 20),
          Text("No gifts added yet!",
              style: Styles.textStyle18.copyWith(
                color: Colors.grey,
              )),
        ],
      ),
    );
  }
}
