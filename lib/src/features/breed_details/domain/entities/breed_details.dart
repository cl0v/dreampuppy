class BreedDetails {
  final String breed;
  final String category;
  final String description;
  final List<String> variations;
  final List<String> colors;
  final List<String> imagesUrl;

  BreedDetails({
    required this.breed,
    required this.category,
    required this.description,
    required this.variations,
    required this.colors,
    required this.imagesUrl,
  });
}
