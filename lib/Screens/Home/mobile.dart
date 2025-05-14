import 'package:flutter/material.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({super.key});

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  final ScrollController scrollController = ScrollController();
  final List<GlobalKey> sectionKeys = List.generate(10, (index) => GlobalKey());

  void scrollToSection(int index) {
    Scrollable.ensureVisible(
      sectionKeys[index].currentContext!,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black87),
              child: Center(
                child: Text(
                  "Navigation",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            ...List.generate(
              10,
              (index) => ListTile(
                leading: Icon(Icons.circle),
                title: Text("Section ${index + 1}"),
                onTap: () {
                  Navigator.pop(context); // Close drawer
                  scrollToSection(index);
                },
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(title: Text("Tablet/Mobile View")),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            // Now Scrollable Static Container
            Container(
              height: 100,
              color: Colors.blueAccent,
              child: Center(
                child: Text(
                  "Scrollable Static Container",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),

            // Scrollable Vertical Containers
            Column(
              children: List.generate(
                10,
                (index) => Container(
                  key: sectionKeys[index],
                  height: 150,
                  margin: EdgeInsets.all(8),
                  color: Colors.greenAccent,
                  child: Center(
                    child: Text(
                      "Container ${index + 1}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
