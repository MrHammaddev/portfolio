import 'package:flutter/material.dart';
import 'package:portfolio/Config/app_media.dart';

double kWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double kHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

var sectionsListTitle = [
  "Home",
  "About",
  "Services",
  "Skills",
  "Resume",
  "Projects",
  "Contact",
];

var projectImgs = [
  AppImages.workpal1,
  // AppImages.workpal2,
  AppImages.mul1,
  // AppImages.mul2,
  AppImages.sld1,
  // AppImages.sld2,
  AppImages.apportion1,
  // AppImages.apportion2,
];
var projectTitle = [
  "GPTech: WorkPal",
  "Minhaj University Lahore",
  "Super Law Data System",
  "Apportion Relief Foundation"
];
