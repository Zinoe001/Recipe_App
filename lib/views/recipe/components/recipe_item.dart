import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app_practice/utils/colors.dart';
import 'package:recipe_app_practice/widgets/recipe_custom_icons.dart';
import 'package:recipe_app_practice/widgets/skeleton.dart';
import 'package:shimmer/shimmer.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem(
      {Key? key,
      required this.image,
      required this.text,
      required this.food,
      required this.source,
      required this.time,
      })
      : super(key: key);
  final String image;
  final String text;
  final String food;
  final String source;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.brown.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(
                RecipeApp.bookmark,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food,
                  style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                Text(
                  source,
                  style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 20,
                      width: 2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class RecipeItemSkeleton extends StatelessWidget {
  
  const RecipeItemSkeleton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: kSkelenton,
    child:Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
         const Skeleton(),
          const Positioned(
            top: 20,
            right: 20,
            child:Skeleton(height: 50,width: 50,)
          ),
          Positioned(
            bottom: 40,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Skeleton(height: 25,width: 225,),
                const SizedBox(height: 15),
                const Skeleton(height: 25,width: 175,),
                const SizedBox(height: 25),
                Row(
                  children: [
                    const Skeleton(height: 10,width: 95,),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 20,
                      width: 2,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                   const Skeleton(height: 10,width: 35,),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}
