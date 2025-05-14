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
  "Technologies",
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

var navIcons = [
  AppIcons.homeblack,
  AppIcons.userblack,
  AppIcons.techblack,
  AppIcons.projects,
  AppIcons.contact,
];

var playstoreLinks = [
  "https://play.google.com/store/apps/details?id=pk.gptech.workpal",
  "https://play.google.com/store/apps/details?id=pk.edu.mul&hl=en",
  "https://play.google.com/store/apps/details?id=com.sldsystem&hl=en",
  "https://play.google.com/store/apps/details?id=pk.org.arf&hl=en",
];

var appstoreLinks = [
  "https://apps.apple.com/cl/app/gptech-workpal/id6624304761?l=en-GB",
  "https://apps.apple.com/cl/app/minhaj-university-lahore/id1561727840?l=en-GB",
  "https://apps.apple.com/pk/app/sld-system/id6741755009",
  "https://apps.apple.com/us/app/apportion-relief-foundation/id6447257655",
];
