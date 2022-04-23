import 'package:flutter/material.dart';

class AppItem extends StatelessWidget {
  const AppItem(
      {Key? key,required this.item })
      : super(key: key);
      final String item;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(20),
      width: 95,
      child:  Center(
        child: Text(
          item,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
           
          ),
        ),
      ),
    );
  }
}
