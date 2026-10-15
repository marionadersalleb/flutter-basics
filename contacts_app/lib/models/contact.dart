class Contact {
  final String name;
  final String email;
  final String phone;

  // path of the photo picked from the gallery, null when none was picked
  final String? imagePath;

  const Contact({
    required this.name,
    required this.email,
    required this.phone,
    this.imagePath,
  });
}
