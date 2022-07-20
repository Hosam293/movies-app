import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
var image;

CustomCard({required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image(
        image: (image == null)? NetworkImage('https://w0.peakpx.com/wallpaper/62/1005/HD-wallpaper-netflix-streaks-abstract-background-blue-colors-colour-colours-dark-neon-netflix.jpg'):NetworkImage(
            image
        ),
        height: 180,
        width: 120,
        fit: BoxFit.cover,
      ),

    );
  }
}
