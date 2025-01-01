class Challenge {
  final String id;
  final String title;
  final bool isAvailable;

  Challenge({
    required this.id,
    required this.title,
    this.isAvailable = false,
  });
}
