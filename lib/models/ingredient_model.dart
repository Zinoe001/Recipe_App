
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
        image: json["image"]??="https://media.istockphoto.com/vectors/thumbnail-image-vector-grahic-vector-id1147544807?k=20&m=1147544807&s=612x612&w=0&h=pBhz1dkwsCMq37Udtp9sfxbjaMl27UapoyYpQm0anc=",
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
