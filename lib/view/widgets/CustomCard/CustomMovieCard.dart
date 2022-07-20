import 'package:flutter/material.dart';

class CustomMovieCard extends StatelessWidget {
  String? image;
  String? date;
  dynamic rate;

  String? title;
  GestureTapCallback? onTap;

  CustomMovieCard({this.image, this.title, this.onTap, this.date, this.rate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.teal, width: 3),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Card(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                      '$image',
                    ),
                    fit: BoxFit.cover,
                  )),
                ),
                const SizedBox(
                  height: 3,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text(
                          '$title',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.amberAccent,
                                fontSize: 12,
                                height: 1.2,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '$date',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.amberAccent,
                                      fontSize: 12,
                                      height: 1.2,
                                    ),
                          ),
                          const Spacer(),
                          Text(
                            '$rate/10',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.amberAccent,
                                      fontSize: 12,
                                      height: 1.2,
                                    ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
