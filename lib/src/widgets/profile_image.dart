import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;
  final double blurRadius;
  final double spreadRadius;

  const ProfileImage({
    super.key,
    required this.imagePath,
    required this.height,
    required this.width,
    this.blurRadius = 6.0,
    this.spreadRadius = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: spreadRadius,
            blurRadius: blurRadius,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        frameBuilder: (BuildContext context, Widget child, int? frame,
            bool wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            return child;
          }
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 750),
            child: frame != null
                ? child
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      ),
    );
  }
}
