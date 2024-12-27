class Gift {
  final String recipientName;
  final String giftIdea;
  final String description;
  final DateTime occasionDate;
  final String occasion;
  bool hasReminder;

  Gift({
    required this.recipientName,
    required this.giftIdea,
    required this.description,
    required this.occasionDate,
    required this.occasion,
    this.hasReminder = false,
  });
}