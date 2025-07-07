class Recipe {
  Recipe({
    required this.author,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.methodSteps,
    required this.servingSize,
    required this.prepTime,
    required this.cookingTime,
  });

  factory Recipe.fromJson(dynamic json, String uid) {
    return Recipe(
      author: uid,
      name: json["name"] as String,
      description: json["description"] as String,
      ingredients: json["ingredients"] as List<String>,
      methodSteps: json["methodSteps"] as List<String>,
      servingSize: json["servingSize"] as int,
      prepTime: json["prepTime"] as int,
      cookingTime: json["cookingTime"] as int,
    );
  }

  final String author;
  final String name;
  final String description;
  final List<String> ingredients;
  final List<String> methodSteps;
  final int servingSize;
  final int prepTime;
  final int cookingTime;
}
