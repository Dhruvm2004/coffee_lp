// To parse this JSON data, do
//
//     final food = foodFromJson(jsonString);



class Food {
    String context;
    FoodType type;
    String id;
    Category category;
    String datePublished;
    String description;
    String image;
    String name;
    String prepTime;
    List<String> recipeIngredient;
    List<RecipeInstruction> recipeInstructions;
    String recipeYield;
    String totalTime;

    Food({
        required this.context,
        required this.type,
        required this.id,
        required this.category,
        required this.datePublished,
        required this.description,
        required this.image,
        required this.name,
        required this.prepTime,
        required this.recipeIngredient,
        required this.recipeInstructions,
        required this.recipeYield,
        required this.totalTime,
    });

    factory Food.fromJson(Map<String, dynamic> json) => Food(
        context: json["@context"],
        type: foodTypeValues.map[json["@type"]]!,
        id: json["_id"],
        category: categoryValues.map[json["category"]]!,
        datePublished: json["datePublished"],
        description: json["description"],
        image: json["image"],
        name: json["name"],
        prepTime: json["prepTime"],
        recipeIngredient: List<String>.from(json["recipeIngredient"].map((x) => x)),
        recipeInstructions: List<RecipeInstruction>.from(json["recipeInstructions"].map((x) => RecipeInstruction.fromJson(x))),
        recipeYield: json["recipeYield"],
        totalTime: json["totalTime"],
    );

    Map<String, dynamic> toJson() => {
        "@context": context,
        "@type": foodTypeValues.reverse[type],
        "_id": id,
        "category": categoryValues.reverse[category],
        "datePublished": datePublished,
        "description": description,
        "image": image,
        "name": name,
        "prepTime": prepTime,
        "recipeIngredient": List<dynamic>.from(recipeIngredient.map((x) => x)),
        "recipeInstructions": List<dynamic>.from(recipeInstructions.map((x) => x.toJson())),
        "recipeYield": recipeYield,
        "totalTime": totalTime,
    };
}

enum Category {
    FOOD
}

final categoryValues = EnumValues({
    "FOOD": Category.FOOD
});

class RecipeInstruction {
    RecipeInstructionType type;
    String image;
    String name;
    String text;

    RecipeInstruction({
        required this.type,
        required this.image,
        required this.name,
        required this.text,
    });

    factory RecipeInstruction.fromJson(Map<String, dynamic> json) => RecipeInstruction(
        type: recipeInstructionTypeValues.map[json["@type"]]!,
        image: json["image"],
        name: json["name"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "@type": recipeInstructionTypeValues.reverse[type],
        "image": image,
        "name": name,
        "text": text,
    };
}

enum RecipeInstructionType {
    HOW_TO_STEP
}

final recipeInstructionTypeValues = EnumValues({
    "HowToStep": RecipeInstructionType.HOW_TO_STEP
});

enum FoodType {
    RECIPE
}

final foodTypeValues = EnumValues({
    "Recipe": FoodType.RECIPE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
