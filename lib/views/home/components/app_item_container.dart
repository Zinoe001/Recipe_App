import 'package:flutter/material.dart';

class AppItem extends StatelessWidget {
  const AppItem(
      {Key? key,required this.item,required this.backgroundColor,required this.textColor})
      : super(key: key);
      final String item;

      final Color backgroundColor;
      final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      width: 95,
      height: 45,
      child:  Center(
        child: Text(
          item,
          style:  TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
           
          ),
        ),
      ),
    );
  }
}
