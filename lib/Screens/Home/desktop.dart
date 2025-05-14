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
      appBar: simpleAppBarWidget(context, "title"),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Age:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "25",
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
              // physics: AlwaysScrollableScrollPhysics(
              //     parent: BouncingScrollPhysics()),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                child: Column(
                  children: List.generate(
                    sectionsListTitle.length,
                    (index) => Container(
                        key: sectionKeys[index],
                        // height: 150,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                        margin: EdgeInsets.only(bottom: 40),
                        decoration: BoxDecoration(
                            color: context.theme.cardColor,
                            borderRadius: BorderRadius.circular(25)),
                        child: _buildContainerContent(index)),
                  ),
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
                sectionsListTitle.length,
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
                    message: sectionsListTitle[index], // Tooltip message
                    preferBelow: true, // Show tooltip above or to the side
                    verticalOffset: 30, // Adjust vertical offset
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
                            child: Icon(Icons.home),
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
            HeadingName(title: "Introduce"),
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
                // Center(
                //   child: AvatarGlow(
                //     glowRadiusFactor: 0.4,
                //     glowColor: context.theme.primaryColor.withOpacity(0.3),
                //     duration: Duration(milliseconds: 1000),
                //     repeat: true,
                //     curve: Curves.easeOutQuad,
                //     child: Icon(
                //       Icons.circle,
                //       color: context.theme.primaryColor,
                //     ),
                //   ),
                // ),
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
            Container(
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
          ],
        );
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              decoration: BoxDecoration(
                border:
                    Border.all(color: context.theme.primaryColor, width: 0.5),
                borderRadius: BorderRadius.circular(25),
                color: Colors.transparent,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.person_2_outlined,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "ABOUT ME",
                    style: context.theme.textTheme.bodySmall,
                  )
                ],
              ),
            ),
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Container(
            //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //       decoration: BoxDecoration(
            //         border: Border.all(
            //             color: context.theme.primaryColor, width: 0.5),
            //         borderRadius: BorderRadius.circular(25),
            //         color: Colors.transparent,
            //       ),
            //       child: Text(
            //         "Flutter (95%)",
            //         style: context.theme.textTheme.bodyLarge!
            //             .merge(TextStyle(fontWeight: FontWeight.normal)),
            //       ),
            //     ),
            //     Container(
            //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //       decoration: BoxDecoration(
            //         border: Border.all(
            //             color: context.theme.primaryColor, width: 0.5),
            //         borderRadius: BorderRadius.circular(25),
            //         color: Colors.transparent,
            //       ),
            //       child: Text(
            //         "Dart (90%)",
            //         style: context.theme.textTheme.bodyLarge!
            //             .merge(TextStyle(fontWeight: FontWeight.normal)),
            //       ),
            //     ),
            //     Container(
            //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //       decoration: BoxDecoration(
            //         border: Border.all(
            //             color: context.theme.primaryColor, width: 0.5),
            //         borderRadius: BorderRadius.circular(25),
            //         color: Colors.transparent,
            //       ),
            //       child: Text(
            //         "Firebase (75%)",
            //         style: context.theme.textTheme.bodyLarge!
            //             .merge(TextStyle(fontWeight: FontWeight.normal)),
            //       ),
            //     ),
            //     Container(
            //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //       decoration: BoxDecoration(
            //         border: Border.all(
            //             color: context.theme.primaryColor, width: 0.5),
            //         borderRadius: BorderRadius.circular(25),
            //         color: Colors.transparent,
            //       ),
            //       child: Text(
            //         "Web Applications (80%)",
            //         style: context.theme.textTheme.bodyLarge!
            //             .merge(TextStyle(fontWeight: FontWeight.normal)),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 40,
            // ),
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Text("Email: ",
            //         style:
            //             TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     Text("hamad.aslam7889@gmail.com",
            //         style:
            //             TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
            //   ],
            // )
          ],
        );
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingName(title: "Tech Stack"),
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
                techstackButton("Github", AppIcons.github),
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
            HeadingName(title: "Projects"),
            SizedBox(
              height: 30,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).size.width > 800 ? 3 : 2,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 40,
                  childAspectRatio: 1),
              itemCount: projectImgs.length,
              itemBuilder: (context, index) {
                bool isHovering = false; // Track hover state for each container
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        appLinkButton(
                                            "Android",
                                            AppIcons.playstore,
                                            "https://play.google.com/store/apps/details?id=pk.gptech.workpal"),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        appLinkButton(
                                            "iOS",
                                            AppIcons.applestore,
                                            "https://apps.apple.com/cl/app/gptech-workpal/id6624304761?l=en-GB")
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
            ),
          ],
        );
      case 4:
        return Container();
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
                .externalApplication, // Opens in a new tab or external browser
          );
        } else {
          // Handle the error if the URL cannot be launched
          print("Could not launch $url");
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
  const HeadingName({super.key, required this.title});
  final String title;

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
          Icon(
            Icons.home,
          ),
          SizedBox(
            width: 5,
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
