import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ripple_map_animation/place_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.place}) : super(key: key);
  final PlaceModel place;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: AspectRatio(
          aspectRatio: .75 / 1,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: CupertinoColors.inactiveGray.withOpacity(.4),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/${place.image}'),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          '${place.distance} Km',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(.6)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    place.name,
                    style: TextStyle(
                        color: Colors.white.withOpacity(.9),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      ...List.generate(
                        place.rating,
                        (index) => const Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Icon(
                            CupertinoIcons.star,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                      ...List.generate(
                        5 - place.rating,
                        (index) => const Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Icon(
                            CupertinoIcons.star,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
