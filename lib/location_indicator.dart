import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

class LocationIndicator extends StatelessWidget {
  const LocationIndicator(
      {Key? key, this.top = 0, this.left = 0, required this.placeName})
      : super(key: key);
  final double top;
  final double left;
  final String placeName;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              placeName,
              style: TextStyle(
                color: Colors.white.withOpacity(.9),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green.withOpacity(.5),
            ),
            alignment: Alignment.center,
            child: Animator<double>(
              duration: const Duration(seconds: 1),
              cycles: 0,
              tween: Tween<double>(begin: 5, end: 8),
              builder: (context, animation, _) => Container(
                  margin: EdgeInsets.all(animation.value),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red)),
            ),
          ),
        ],
      ),
    );
  }
}
