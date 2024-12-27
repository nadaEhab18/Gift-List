import 'package:depi_gift_list/constant.dart';
import 'package:depi_gift_list/features/home/data/models/gift_item_model.dart';
import 'package:flutter/material.dart';

class AddGiftScreen extends StatefulWidget {
  const AddGiftScreen({super.key});

  @override
  State<AddGiftScreen> createState() => _AddGiftScreenState();
}

class _AddGiftScreenState extends State<AddGiftScreen> {
  final _formKey = GlobalKey<FormState>();
  final _recipientController = TextEditingController();
  final _giftIdeaController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _occasionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  bool _hasReminder = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Gift'),
        backgroundColor: const Color(0xFF4B0082),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildTextFormField(
              controller: _recipientController,
              label: 'Recipient Name',
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter recipient name' : null,
            ),
            const SizedBox(height: 16),
            _buildTextFormField(
              controller: _giftIdeaController,
              label: 'Gift Idea',
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter gift idea' : null,
            ),
            const SizedBox(height: 16),
            _buildTextFormField(
              controller: _descriptionController,
              label: 'Description',
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            _buildTextFormField(
              controller: _occasionController,
              label: 'Occasion',
            ),
            const SizedBox(height: 16),
            _buildDatePicker(),
            const SizedBox(height: 16),
            _buildReminderSwitch(),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Save Gift',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
      maxLines: maxLines,
    );
  }

  Widget _buildDatePicker() {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.calendar_today),
        title: const Text('Occasion Date'),
        subtitle: Text(_formatDate(_selectedDate)),
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
    );
  }

  Widget _buildReminderSwitch() {
    return SwitchListTile(
      title: const Text('Set Reminder'),
      value: _hasReminder,
      onChanged: (value) => setState(() => _hasReminder = value),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final gift = Gift(
        recipientName: _recipientController.text,
        giftIdea: _giftIdeaController.text,
        description: _descriptionController.text,
        occasionDate: _selectedDate,
        occasion: _occasionController.text,
        hasReminder: _hasReminder,
      );
      Navigator.pop(context, gift);
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
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
