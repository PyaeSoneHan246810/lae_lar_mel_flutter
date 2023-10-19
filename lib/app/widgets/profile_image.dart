import 'package:flutter/material.dart';

import '../config/colors.dart';

class ProfileImageWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onImageClicked;
  final VoidCallback onEditIconClicked;

  const ProfileImageWidget({
    Key? key,
    required this.imagePath,
    required this.onImageClicked,
    required this.onEditIconClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = AppColor.primaryColor;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 140,
          height: 140,
          child: InkWell(onTap: onImageClicked),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: GestureDetector(
          onTap: onEditIconClicked,
          child: buildCircle(
            color: color,
            all: 8,
            child: const Icon(
              Icons.edit_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
