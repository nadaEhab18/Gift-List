import 'package:depi_gift_list/features/home/data/models/gift_item_model.dart';
import 'package:flutter/material.dart';

class ItemAdded extends StatelessWidget {
  const ItemAdded({
    super.key,
    required this.gift,
  });
  final Gift gift;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Recipient Name
        Center(
          child: Text(
            gift.recipientName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4B0082),
            ),
          ),
        ),
        const Divider(thickness: 1, height: 20, color: Colors.grey),

        /// Gift Idea
        Row(
          children: [
            const Icon(
              Icons.card_giftcard,
              color: Colors.black54,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                gift.giftIdea,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        /// Description
        if (gift.description.isNotEmpty) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.description,
                color: Colors.black54,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  gift.description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],

        /// Occasion
        Row(
          children: [
            const Icon(
              Icons.event,
              color: Colors.black54,
            ),
            const SizedBox(width: 8),
            Text(
              gift.occasion,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        /// Occasion Date
        Row(
          children: [
            const Icon(
              Icons.calendar_today,
              color: Colors.black54,
            ),
            const SizedBox(width: 8),
            Text(
              "${gift.occasionDate.day}/${gift.occasionDate.month}/${gift.occasionDate.year}",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        /// Close Button
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4B0082),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Close",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
