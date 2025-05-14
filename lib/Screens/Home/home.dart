import 'package:flutter/material.dart';
import 'package:portfolio/Screens/Home/desktop.dart';
import 'package:portfolio/Screens/Home/mobile.dart';
import 'package:portfolio/responsive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobile: HomeMobile(), desktop: HomeDesktop());
  }
}
