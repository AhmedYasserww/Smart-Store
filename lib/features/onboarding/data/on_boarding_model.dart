import 'package:flutter/material.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String subTitle;
  final Alignment imageAlignment;
  final Color selectedColor;
  final Color unSelectedColor;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.imageAlignment,
    required this.selectedColor,
    required this.unSelectedColor,
  });
}