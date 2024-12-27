import 'package:depi_gift_list/features/home/data/models/gift_item_model.dart';
import 'package:flutter/material.dart';

class AddGiftDialog extends StatefulWidget {
  final Function(Gift) onAdd;

  const AddGiftDialog({super.key, required this.onAdd});

  @override
  State<AddGiftDialog> createState() => _AddGiftDialogState();
}

class _AddGiftDialogState extends State<AddGiftDialog> {
  final _recipientController = TextEditingController();
  final _giftIdeaController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _occasionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Gift'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _recipientController,
              decoration: const InputDecoration(labelText: 'Recipient Name'),
            ),
            TextField(
              controller: _giftIdeaController,
              decoration: const InputDecoration(labelText: 'Gift Idea'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _occasionController,
              decoration: const InputDecoration(labelText: 'Occasion'),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Date'),
              subtitle: Text(
                '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
              ),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (date != null) {
                  setState(() => _selectedDate = date);
                }
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_recipientController.text.isNotEmpty &&
                _giftIdeaController.text.isNotEmpty) {
              widget.onAdd(Gift(
                recipientName: _recipientController.text,
                giftIdea: _giftIdeaController.text,
                description: _descriptionController.text,
                occasionDate: _selectedDate,
                occasion: _occasionController.text,
              ));
              Navigator.pop(context);
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _recipientController.dispose();
    _giftIdeaController.dispose();
    _descriptionController.dispose();
    _occasionController.dispose();
    super.dispose();
  }
}
