// import 'package:flutter/material.dart';

// class ResponsiveLayout extends StatefulWidget {
//   final Widget mobile;
//   // final Widget? tablet;
//   final Widget desktop;
//   const ResponsiveLayout({
//     super.key,
//     required this.mobile,
//     // this.tablet,
//     required this.desktop,
//   });

//   @override
//   _ResponsiveLayoutState createState() => _ResponsiveLayoutState();
// }

// class _ResponsiveLayoutState extends State<ResponsiveLayout> {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         if (constraints.maxWidth >= 1280) {
//           return widget.desktop;
//         } else {
//           return widget.mobile;
//         }
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const Responsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  // screen sizes
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1280 &&
      MediaQuery.of(context).size.width >= 600;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1280;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1280) {
          return desktop;
        } else if (constraints.maxWidth >= 600) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
