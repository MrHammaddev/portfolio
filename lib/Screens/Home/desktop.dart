import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/Config/Utils/constants.dart';
import 'package:portfolio/Config/Widgets/appbar.dart';
import 'package:portfolio/Config/app_media.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({super.key});

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  final ScrollController scrollController = ScrollController();
  final List<GlobalKey> sectionKeys =
      List.generate(sectionsListTitle.length, (index) => GlobalKey());

  bool isHovering = false;
  List<bool> isHoveringList = List.generate(10, (index) => false);

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
      // appBar: simpleAppBarWidget(context, "title"),
      body: Row(
        children: [
          // Static Non-Scrollable Container
          Container(
              width: 400,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(left: 60, top: 60, bottom: 60),
              decoration: BoxDecoration(
                  color: context.theme.cardColor,
                  borderRadius: BorderRadius.circular(25)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 170,
                    height: 170,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        color: context.theme.cardColor, shape: BoxShape.circle),
                    child: Image.asset("assets/images/me.jpg"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Malik Hammad",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 12,
                  ),
                  Text("Flutter Developer",
                      style: TextStyle(
                          color: context.theme.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.normal)),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final Uri url = Uri.parse(
                              "https://www.linkedin.com/in/malik-hammad-");
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            Get.snackbar(
                              "Error",
                              "An error occurred. Please try again.",
                              icon: Icon(
                                Icons.error,
                                color: Colors.white,
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 112, 102),
                              colorText: Colors.white,
                              duration: Duration(seconds: 3),
                              snackPosition: SnackPosition.BOTTOM,
                              borderRadius: 10,
                              margin: EdgeInsets.all(10),
                              borderColor: Colors.red,
                              borderWidth: 2,
                              maxWidth: 300,
                            );
                          }
                        },
                        child: Image.asset(
                          AppIcons.linkedin,
                          height: 25,
                          width: 25,
                          color: context.theme.iconTheme.color,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () async {
                          final Uri url =
                              Uri.parse("https://github.com/MrHammaddev");
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            Get.snackbar(
                              "Error",
                              "An error occurred. Please try again.",
                              icon: Icon(
                                Icons.error,
                                color: Colors.white,
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 112, 102),
                              colorText: Colors.white,
                              duration: Duration(seconds: 3),
                              snackPosition: SnackPosition.BOTTOM,
                              borderRadius: 10,
                              margin: EdgeInsets.all(10),
                              borderColor: Colors.red,
                              borderWidth: 2,
                              maxWidth: 300,
                            );
                          }
                        },
                        child: Image.asset(
                          AppIcons.githubblack,
                          height: 25,
                          width: 25,
                          color: context.theme.iconTheme.color,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Country:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Pakistan",
                        style: TextStyle(
                            color: context.theme.textTheme.labelLarge!.color,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Email:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "hamad.aslam7889@gmail.com",
                        style: TextStyle(
                            color: context.theme.textTheme.labelLarge!.color,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: kWidth(context),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                        color: context.theme.secondaryHeaderColor,
                        borderRadius: BorderRadius.circular(14)),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Skills",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: skillsCircularProgress(
                                  context, "Flutter", 95),
                            ),
                            Expanded(
                              child:
                                  skillsCircularProgress(context, "Dart", 90),
                            ),
                            // Expanded(
                            //   child: skillsCircularProgress(context, "Web", 80),
                            // ),
                            Expanded(
                              child: skillsCircularProgress(
                                  context, "Firebase", 75),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          SizedBox(
            width: 20,
          ),
          // Scrollable Vertical Containers
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                child: Column(
                  children: [
                    Column(
                      children: List.generate(
                        sectionsListTitle.length,
                        (index) => Container(
                            key: sectionKeys[index],
                            // height: 150,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 50),
                            margin: EdgeInsets.only(bottom: 40),
                            decoration: BoxDecoration(
                                color: context.theme.cardColor,
                                borderRadius: BorderRadius.circular(25)),
                            child: _buildContainerContent(index)),
                      ),
                    ),
                    Container(
                      width: kWidth(context),
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          "© 2025 Malik Hammad",
                          style: TextStyle(
                            color: context.theme.textTheme.labelLarge!.color,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          // Vertical Navigation Bar
          Container(
            width: 100,
            padding: EdgeInsets.symmetric(vertical: 50),
            margin: EdgeInsets.only(right: 40),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: context.theme.primaryColor, width: 0.3),
              borderRadius: BorderRadius.circular(60),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                navIcons.length,
                (index) => MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      isHoveringList[index] = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isHoveringList[index] = false;
                    });
                  },
                  child: Tooltip(
                    message: sectionsListTitle[index],
                    preferBelow: true,
                    verticalOffset: 30,
                    decoration: BoxDecoration(
                      color: context.theme.cardColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    textStyle: TextStyle(
                      color: context.theme.primaryColor, // Green text
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color: isHoveringList[index]
                            ? context.theme.cardColor
                            : context.theme.scaffoldBackgroundColor,
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          // onHover: (value) {
                          //   setState(() {
                          //     isHovering = value;
                          //   });
                          // },
                          onTap: () {
                            scrollToSection(index);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Image.asset(
                              navIcons[index],
                              color: context.theme.iconTheme.color,
                              height: 20,
                              width: 20,
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  skillsCircularProgress(BuildContext context, String title, double value) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                value: value / 100,
                strokeCap: StrokeCap.round,
                backgroundColor: context.theme.cardColor,
                strokeWidth: 3,
                valueColor:
                    AlwaysStoppedAnimation<Color>(context.theme.primaryColor),
              ),
            ),
            Text("$value%",
                style: TextStyle(
                    color: context.theme.textTheme.labelLarge!.color,
                    fontSize: 14,
                    fontWeight: FontWeight.normal)),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(title,
            style: TextStyle(
              fontSize: 13,
            )),
      ],
    );
  }

  _buildContainerContent(int index) {
    switch (index) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingName(title: "Introduce", icn: AppIcons.homeblack),
            SizedBox(
              height: 30,
            ),
            RichText(
                text: TextSpan(
                    text: "Building Scalable, Beautiful, and High-Performance ",
                    style: context.theme.textTheme.displayLarge!.merge(
                        TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.3)),
                    children: [
                  TextSpan(
                      text: "Cross-Platform Apps",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: context.theme.primaryColor)),
                ])),
            // Text(
            //   "Crafting Seamless Cross-Platform Experiences with Flutter",
            //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            // ),
            SizedBox(
              height: 30,
            ),
            RichText(
                text: TextSpan(
                    text: "Turning Ideas into Reality with ",
                    style: context.theme.textTheme.bodyLarge!.merge(TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 1.3)),
                    children: [
                  TextSpan(
                      text: "Flutter",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      )),
                  TextSpan(
                      text:
                          ". I specialize in crafting smooth, fast, and scalable applications that work flawlessly across",
                      style: TextStyle(
                        fontSize: 22,
                      )),
                  TextSpan(
                      text: " iOS, Android, Web, and Desktop.",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                ])),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Center(
                  child: AvatarGlow(
                    glowRadiusFactor: 0.4,
                    glowColor: context.theme.primaryColor.withOpacity(0.3),
                    duration: Duration(milliseconds: 1000),
                    repeat: true,
                    curve: Curves.easeOutQuad,
                    child: Icon(
                      Icons.circle,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Availabe for work",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
              ],
            ),

            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () async {
                final Uri emailUri = Uri(
                  scheme: 'mailto',
                  path: 'hamad.aslam7889@gmail.com',
                  query: 'subject=Hello&body=Hi Malik Hammad,',
                );
                if (await canLaunchUrl(emailUri)) {
                  await launchUrl(emailUri,
                      mode: LaunchMode.externalApplication);
                } else {
                  Get.snackbar(
                    "Error",
                    "An error occurred. Please try again.",
                    icon: Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                    backgroundColor: const Color.fromARGB(255, 255, 112, 102),
                    colorText: Colors.white,
                    duration: Duration(seconds: 3),
                    snackPosition: SnackPosition.BOTTOM,
                    borderRadius: 10,
                    margin: EdgeInsets.all(10),
                    borderColor: Colors.red,
                    borderWidth: 2,
                    maxWidth: 300,
                  );
                }
              },
              child: Container(
                width: 200,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                    color: context.theme.primaryColor,
                    borderRadius: BorderRadius.circular(35)),
                child: Center(
                  child: Text(
                    "Hire Me",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        );
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingName(title: "About me", icn: AppIcons.userblack),
            SizedBox(
              height: 30,
            ),
            RichText(
                text: TextSpan(
                    text: "About ",
                    style: context.theme.textTheme.displayLarge!.merge(
                        TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.3)),
                    children: [
                  TextSpan(
                      text: "ME",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: context.theme.primaryColor)),
                ])),
            SizedBox(
              height: 20,
            ),
            RichText(
                text: TextSpan(
                    text: "I’m a ",
                    style: context.theme.textTheme.bodyLarge!.merge(TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.3)),
                    children: [
                  TextSpan(
                      text: "Flutter Developer ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  TextSpan(
                      text: "with ",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  TextSpan(
                      text: "4+ years ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  TextSpan(
                      text:
                          "of experience building cross-platform apps, including a ",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  TextSpan(
                      text:
                          "Campus Management System (CMS), e-learning (LMS), HR platforms, donation apps, and legal solutions. ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  TextSpan(
                      text: "I’ve also engineered responsive ",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  TextSpan(
                      text: "Web Applications ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  TextSpan(
                      text: "using Flutter, integrated ",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  TextSpan(
                      text: "Firebase ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  TextSpan(
                      text:
                          "for backend workflows, and managed projects collaboratively via ",
                      style: TextStyle(
                        fontSize: 22,
                      )),
                  TextSpan(
                      text: "Github. ",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                  TextSpan(
                      text:
                          "Passionate about clean code and impactful digital experiences, I thrive on transforming ideas into scalable, user-friendly solutions.",
                      style: TextStyle(
                        fontSize: 22,
                      )),
                ])),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("12+",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                            color: context.theme.primaryColor)),
                    Text("Happy Clients")
                  ],
                ),
                Column(
                  children: [
                    Text("4+",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                            color: context.theme.primaryColor)),
                    Text("Years of Experience")
                  ],
                ),
                Column(
                  children: [
                    Text("24+",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                            color: context.theme.primaryColor)),
                    Text("Projects")
                  ],
                )
              ],
            )
          ],
        );
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingName(
              title: "Tech Stack",
              icn: AppIcons.techblack,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
                "A quick look at the tools and technologies I work with to build fast, reliable, and scalable applications. From front-end frameworks to back-end services and databases, these are the technologies that power my projects. ",
                style: context.theme.textTheme.bodyLarge!.merge(TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.3))),
            SizedBox(
              height: 20,
            ),
            Text("Mobile App Development",
                style: context.theme.textTheme.bodyLarge!.merge(TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ))),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                techstackButton("Flutter", AppIcons.flutter),
                SizedBox(width: 10),
                techstackButton("Dart", AppIcons.dart),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("Website Development",
                style: context.theme.textTheme.bodyLarge!.merge(TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ))),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                techstackButton("HTML 5", AppIcons.html5),
                SizedBox(width: 10),
                techstackButton("CSS 3", AppIcons.css3),
                SizedBox(width: 10),
                techstackButton("Bootstrap", AppIcons.bootstrap),
                SizedBox(width: 10),
                techstackButton("Javscript", AppIcons.javascript),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("Server Side",
                style: context.theme.textTheme.bodyLarge!.merge(TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ))),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                techstackButton("php", AppIcons.php),
                SizedBox(width: 10),
                techstackButton("Node.js", AppIcons.nodejs),
                SizedBox(width: 10),
                techstackButton("Express.js", AppIcons.expressjs),
                SizedBox(width: 10),
                techstackButton("REST APIs", AppIcons.restapi),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("Databases",
                style: context.theme.textTheme.bodyLarge!.merge(TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ))),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                techstackButton("Firebase", AppIcons.firebase),
                SizedBox(width: 10),
                techstackButton("Postgres SQL", AppIcons.database),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("Version controlling",
                style: context.theme.textTheme.bodyLarge!.merge(TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ))),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                techstackButton("Github", AppIcons.githubwhite),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("UI/UX Design",
                style: context.theme.textTheme.bodyLarge!.merge(TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ))),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                techstackButton("Figma", AppIcons.figma),
              ],
            ),
          ],
        );
      case 3:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingName(
              title: "Projects",
              icn: AppIcons.projects,
            ),
            SizedBox(
              height: 30,
            ),
            LayoutBuilder(builder: (context, constraints) {
              final width = constraints.maxWidth;
              final height = constraints.maxHeight;
              final itemHeight = 300.0;
              final itemWidth = 300.0;

              final crossCount = (width / itemWidth).floor();
              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossCount,
                  childAspectRatio: itemWidth / itemHeight,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 40,
                ),
                itemCount: projectImgs.length,
                itemBuilder: (context, index) {
                  bool isHovering =
                      false; // Track hover state for each container
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            isHovering = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            isHovering = false;
                          });
                        },
                        child: AnimatedContainer(
                          duration:
                              Duration(milliseconds: 300), // Smooth transition
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color: context.theme.cardColor,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: isHovering
                                ? [
                                    BoxShadow(
                                      color: context.theme.primaryColor
                                          .withOpacity(0.5),
                                      blurRadius: 15,
                                      spreadRadius: 3,
                                    ),
                                  ]
                                : [
                                    BoxShadow(
                                      color: context.theme.shadowColor,
                                      blurRadius: 4,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(projectImgs[index]),
                              // SizedBox(
                              //   height: 15,
                              // ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        projectTitle[index],
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // SizedBox(
                                      //   height: 5,
                                      // ),
                                      // ListView.builder(
                                      //   shrinkWrap: true,
                                      //   physics: NeverScrollableScrollPhysics(),
                                      //   itemCount: 2,
                                      //   itemBuilder:
                                      //       (BuildContext context, int index) {
                                      //     return appLinkButton("title",
                                      //         AppIcons.playstore, "url");
                                      //   },
                                      // ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          appLinkButton(
                                              "Android",
                                              AppIcons.playstore,
                                              playstoreLinks[index]),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          appLinkButton(
                                              "iOS",
                                              AppIcons.applestore,
                                              appstoreLinks[index]),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }),
          ],
        );
      case 4:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingName(title: "Contact us", icn: AppIcons.contact),
            SizedBox(
              height: 30,
            ),
            RichText(
                text: TextSpan(
                    text: "Get in Touch",
                    style: context.theme.textTheme.displayLarge!.merge(
                        TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.3)),
                    children: [
                  TextSpan(
                      text: " with me",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: context.theme.primaryColor)),
                ])),
            SizedBox(
              height: 20,
            ),
            Text(
                "I’m always open to discussing new projects, creative ideas, or opportunities to be part of your vision.",
                style: context.theme.textTheme.bodyLarge!.merge(TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.3))),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                final Uri emailUri = Uri(
                  scheme: 'mailto',
                  path: 'hamad.aslam7889@gmail.com',
                  query:
                      'subject=Hello&body=Hi Malik Hammad,', // Optional query parameters
                );
                if (await canLaunchUrl(emailUri)) {
                  await launchUrl(emailUri,
                      mode: LaunchMode.externalApplication);
                } else {
                  Get.snackbar(
                    "Error",
                    "An error occurred. Please try again.",
                    icon: Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                    backgroundColor: const Color.fromARGB(255, 255, 112, 102),
                    colorText: Colors.white,
                    duration: Duration(seconds: 3),
                    snackPosition: SnackPosition.BOTTOM,
                    borderRadius: 10,
                    margin: EdgeInsets.all(10),
                    borderColor: Colors.red,
                    borderWidth: 2,
                    maxWidth: 300,
                  );
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.email_rounded,
                      color: context.theme.primaryColor,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("hamad.aslam7889@gmail.com"),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: context.theme.primaryColor,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                try {
                  final Uri whatsappUri = Uri.parse(
                      "https://wa.me/923334334116?text=Hi Malik Hammad, I would like to connect with you.");
                  if (await canLaunchUrl(whatsappUri)) {
                    await launchUrl(whatsappUri,
                        mode: LaunchMode.externalApplication);
                  } else {
                    throw 'Could not launch $whatsappUri';
                  }
                } catch (e) {
                  Get.snackbar(
                    "Error",
                    "An error occurred. Please try again.",
                    icon: Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                    backgroundColor: const Color.fromARGB(255, 255, 112, 102),
                    colorText: Colors.white,
                    duration: Duration(seconds: 3),
                    snackPosition: SnackPosition.BOTTOM,
                    borderRadius: 10,
                    margin: EdgeInsets.all(10),
                    borderColor: Colors.red,
                    borderWidth: 2,
                    maxWidth: 300,
                  );
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppIcons.whatsapp,
                        height: 20,
                        width: 20,
                        color: context.theme.primaryColor),
                    SizedBox(
                      width: 15,
                    ),
                    Text("+92 333 4334116"),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: context.theme.primaryColor,
                    )
                  ],
                ),
              ),
            )
          ],
        );
      default:
        return Container();
    }
  }

  appLinkButton(String title, String icn, String url) {
    return GestureDetector(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(
            uri,
            mode: LaunchMode
                .inAppBrowserView, // Opens in a new tab or external browser
          );
        } else {
          Get.snackbar(
            "Error",
            "An error occurred. Please try again.",
            icon: Icon(
              Icons.error,
              color: Colors.white,
            ),
            backgroundColor: const Color.fromARGB(255, 255, 112, 102),
            colorText: Colors.white,
            duration: Duration(seconds: 3),
            snackPosition: SnackPosition.BOTTOM,
            borderRadius: 10,
            margin: EdgeInsets.all(10),
            borderColor: Colors.red,
            borderWidth: 2,
            maxWidth: 300,
          );
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        decoration: BoxDecoration(
          color: context.theme.primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Image.asset(
              icn,
              height: 18,
              width: 18,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              title,
              style: context.theme.textTheme.bodyLarge!.merge(TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              )),
            ),
          ],
        ),
      ),
    );
  }

  techstackButton(String title, String icn) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Image.asset(
            icn,
            height: 20,
            width: 20,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: context.theme.textTheme.bodyLarge!.merge(TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            )),
          ),
        ],
      ),
    );
  }
}

class HeadingName extends StatelessWidget {
  const HeadingName({super.key, required this.title, required this.icn});
  final String title;
  final String icn;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: BoxDecoration(
        border: Border.all(color: context.theme.primaryColor, width: 0.5),
        borderRadius: BorderRadius.circular(25),
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            icn,
            color: context.theme.iconTheme.color,
            height: 18,
            width: 18,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            title.toUpperCase(),
            style: context.theme.textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
