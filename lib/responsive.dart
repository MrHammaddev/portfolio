import 'package:flutter/material.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget mobile;
  // final Widget? tablet;
  final Widget desktop;
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    // this.tablet,
    required this.desktop,
  });

  @override
  _ResponsiveLayoutState createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  // final ScrollController _scrollController = ScrollController();
  // final List<GlobalKey> _sectionKeys =
  //     List.generate(10, (index) => GlobalKey());

  // void _scrollToSection(int index) {
  //   Scrollable.ensureVisible(
  //     _sectionKeys[index].currentContext!,
  //     duration: Duration(milliseconds: 500),
  //     curve: Curves.easeInOut,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1280) {
          return widget.desktop;
        } else {
          return widget.mobile;
        }
      },
    );
  }
}

// // ============================ DESKTOP VIEW ============================

// class DesktopView extends StatelessWidget {
//   final ScrollController scrollController;
//   final List<GlobalKey> sectionKeys;
//   final Function(int) scrollToSection;

//   DesktopView({
//     required this.scrollController,
//     required this.sectionKeys,
//     required this.scrollToSection,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }

// // ============================ TABLET & MOBILE VIEW ============================

// class TabletMobileView extends StatelessWidget {
//   final ScrollController scrollController;
//   final List<GlobalKey> sectionKeys;
//   final Function(int) scrollToSection;

//   TabletMobileView({
//     required this.scrollController,
//     required this.sectionKeys,
//     required this.scrollToSection,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
