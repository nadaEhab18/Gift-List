import 'package:depi_gift_list/constant.dart';
import 'package:depi_gift_list/core/utils/styles.dart';
import 'package:depi_gift_list/features/home/data/models/gift_item_model.dart';
import 'package:depi_gift_list/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:depi_gift_list/features/home/presentation/views/widgets/empty_gift_list.dart';
import 'package:depi_gift_list/features/home/presentation/views/widgets/gift_card.dart';
import 'package:depi_gift_list/features/home/presentation/views/widgets/gift_detail_dialog.dart';
import 'package:depi_gift_list/features/home/presentation/views/widgets/gift_list.dart';
import 'package:depi_gift_list/features/home/presentation/views/widgets/image_banner.dart';
import 'package:depi_gift_list/features/home/presentation/views/widgets/item_added.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final List<Gift> _gifts = [
    Gift(
      recipientName: "Mom",
      giftIdea: "Handmade Photo Album",
      description: "Collect family photos and create a personalized album",
      occasionDate: DateTime(2024, 5, 12), // Mother's Day
      occasion: "Mother's Day",
      hasReminder: true,
    ),
    Gift(
      recipientName: "Dad",
      giftIdea: "Leather Wallet",
      description: "Brown leather wallet with card slots",
      occasionDate: DateTime(2024, 6, 16), // Father's Day
      occasion: "Father's Day",
      hasReminder: false,
    ),
    Gift(
      recipientName: "Sister",
      giftIdea: "Art Supplies Set",
      description: "Professional drawing pencils and sketchbook",
      occasionDate: DateTime(2024, 4, 15), // Birthday
      occasion: "Birthday",
      hasReminder: true,
    ),
  ];

  void _addGift() {
    showDialog(
      context: context,
      builder: (context) => AddGiftDialog(
        onAdd: (gift) {
          setState(() {
            _gifts.add(gift);
          });
        },
      ),
    );
  }

  void _viewGiftDetails(Gift gift) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: ItemAdded(
            gift: gift,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// App bar
              CustomAppBar(
                  screenHeight: screenHeight, screenWidth: screenWidth),
              const SizedBox(
                height: 10,
              ),

              /// Image Banner
              ImageBanner(screenHeight: screenHeight, screenWidth: screenWidth),
              const SizedBox(
                height: 20,
              ),

              /// Gift List
              const Text('Gift List', style: Styles.textStyle20),
              Expanded(
                child: GiftListView(
                  gifts: _gifts,
                  onGiftTap: _viewGiftDetails,
                  onDelete: (index) {
                    setState(() {
                      _gifts.removeAt(index);
                    });
                  },
                  onReminderToggle: (gift) {
                    setState(() {
                      gift.hasReminder = !gift.hasReminder;
                    });
                  },
                ),
              ),
            ],
          ),
        ),

        /// Floating Action Button
        floatingActionButton: FloatingActionButton(
          onPressed: _addGift,
          backgroundColor: const Color(0xFF4B0082),
          elevation: 4,
          child: const Icon(Icons.add, color: kBackgroundColor),
        ),
      ),
    );
  }
}
