import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  double? width = double.infinity;
  double? height = 50;
  VoidCallback? onPressed;
  String text;

  CustomMaterialButton({Key? key,
    this.width,
    this.height,
    this.onPressed,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.teal
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      alignment: Alignment.center,
      child: MaterialButton(
        onPressed: onPressed,
        height: height,
        elevation: 0.0,
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 20, color: Colors.red)),
      ),
    );
  }
}
