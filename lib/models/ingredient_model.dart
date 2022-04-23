
class IngredientsModel {
  IngredientsModel({
    required this.foodId,
    required this.image,
    required this.item,
    required this.amount,
  }) : super();

  final String image;
  final String item;
  final String amount;
  final String foodId;

  factory IngredientsModel.fromJson(Map<String, dynamic> json) {
    return IngredientsModel(
        foodId: json["foodId"],
        image: json["image"],
        item: json["food"],
        amount: json["text"]);
  }
Map<String,dynamic> toJson()=> {
  "foodId":foodId,
  "image":image,
  "food": item,
  "text": amount,
};

}
