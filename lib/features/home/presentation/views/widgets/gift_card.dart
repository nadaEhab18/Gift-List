import 'package:depi_gift_list/features/home/data/models/gift_item_model.dart';
import 'package:flutter/material.dart';

class GiftCard extends StatelessWidget {
  final Gift gift;
  final VoidCallback onReminderToggle;
  final VoidCallback onDelete;

  const GiftCard({
    super.key,
    required this.gift,
    required this.onReminderToggle,
    required this.onDelete,
  });

  bool get isUpcoming {
    final difference = gift.occasionDate.difference(DateTime.now()).inDays;
    return difference >= 0 && difference <= 7;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  gift.recipientName,
                  style: const TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4B0082),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: gift.hasReminder
                        ? const Color(0xFFFF4500)
                        : Colors.grey,
                  ),
                  onPressed: onReminderToggle,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(gift.giftIdea),
            if (gift.description.isNotEmpty)
              Text(
                gift.description,
                style: const TextStyle(color: Colors.grey),
              ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: isUpcoming ? const Color(0xFFFF4500) : Colors.grey,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  '${gift.occasionDate.day}/${gift.occasionDate.month}/${gift.occasionDate.year}',
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  gift.occasion,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
