import 'package:flutter/material.dart';

class OnBoardingImage extends StatelessWidget {
  final String image;
  final Alignment alignment;

  const OnBoardingImage({
    super.key,
    required this.image,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
  //  double height = MediaQuery.of(context).size.height;
    return Align(
      alignment: alignment,
      child: Image.asset(
        image,
    //    height: height*.57,
        fit: BoxFit.cover,
      ),
    );
  }
}
