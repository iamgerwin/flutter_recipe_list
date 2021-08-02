class Recipe {
  final String title;
  final double rating;
  final String cookTime;
  final String thumbnailUrl;

  Recipe(
      {required this.title,
      required this.rating,
      required this.cookTime,
      required this.thumbnailUrl});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      title: json['name'] as String,
      rating: json['rating'] as double,
      cookTime: json['totalTime'] as String,
      thumbnailUrl: json['images'][0]['hostedLargeUrl'] as String,
    );
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {title: $title, rating: $rating, cookTime: $cookTime, thumbanailUrl: $thumbnailUrl}';
  }
}
