class Achievement {
  final String title;
  final String description;
  final String imageUrl;
  final bool isUnlocked;

  const Achievement({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.isUnlocked = false,
  });
}

