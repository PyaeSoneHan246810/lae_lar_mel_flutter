import 'package:flutter/material.dart';

class CustomCircleAnimationGif extends StatelessWidget {
  final String animationGifPath;
  const CustomCircleAnimationGif({
    super.key,
    required this.animationGifPath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      height: 290,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 290,
              height: 290,
              decoration: ShapeDecoration(
                shape: const CircleBorder(),
                image: DecorationImage(
                  image: AssetImage(animationGifPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 129.06,
            top: 4,
            child: Container(
              width: 50,
              height: 24,
              decoration: const ShapeDecoration(
                shape: OvalBorder(),
                image: DecorationImage(
                  image: AssetImage("assets/gifs/gif_progress.gif"),
                  opacity: 0.25,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.96,
            top: 127.03,
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(-1.30),
              child: Container(
                width: 50,
                height: 24,
                decoration: const ShapeDecoration(
                  shape: OvalBorder(),
                  image: DecorationImage(
                    image: AssetImage("assets/gifs/gif_progress.gif"),
                    opacity: 0.25,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 255,
            top: 171.53,
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(-1.43),
              child: Container(
                width: 50,
                height: 24,
                decoration: const ShapeDecoration(
                  shape: OvalBorder(),
                  image: DecorationImage(
                    image: AssetImage("assets/gifs/gif_progress.gif"),
                    opacity: 0.25,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 123.68,
            top: 260.91,
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(0.04),
              child: Container(
                width: 50,
                height: 24,
                decoration: const ShapeDecoration(
                  shape: OvalBorder(),
                  image: DecorationImage(
                    image: AssetImage("assets/gifs/gif_progress.gif"),
                    opacity: 0.25,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
