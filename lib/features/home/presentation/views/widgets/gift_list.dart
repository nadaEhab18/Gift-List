import 'package:flutter/material.dart';
import 'package:depi_gift_list/features/home/data/models/gift_item_model.dart';
import 'package:depi_gift_list/features/home/presentation/views/widgets/gift_card.dart';
import 'package:depi_gift_list/features/home/presentation/views/widgets/empty_gift_list.dart';

class GiftListView extends StatelessWidget {
  final List<Gift> gifts;
  final Function(Gift) onGiftTap;
  final Function(int) onDelete;
  final Function(Gift) onReminderToggle;

  const GiftListView({
    super.key,
    required this.gifts,
    required this.onGiftTap,
    required this.onDelete,
    required this.onReminderToggle,
  });

  @override
  Widget build(BuildContext context) {
    if (gifts.isEmpty) {
      return const EmptyGiftList();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: gifts.length,
      itemBuilder: (context, index) {
        final gift = gifts[index];
        return GestureDetector(
          onTap: () => onGiftTap(gift),
          child: GiftCard(
            gift: gift,
            onReminderToggle: () => onReminderToggle(gift),
            onDelete: () => onDelete(index),
          ),
        );
      },
    );
  }
}