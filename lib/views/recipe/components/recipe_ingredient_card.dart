import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RecipeIngredientCard extends StatelessWidget {
  const RecipeIngredientCard(
      {Key? key,
      required this.ingredient,
      required this.amount,
      required this.image})
      : super(key: key);
  final String ingredient;
  final String amount;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 65,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade100,
      ),
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Center(child: CachedNetworkImage(imageUrl: image)),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            ingredient,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              amount,
              style: const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
