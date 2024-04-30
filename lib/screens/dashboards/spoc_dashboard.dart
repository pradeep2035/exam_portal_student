// ignore_for_file: sized_box_for_whitespace, unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpocDashboard extends StatefulWidget {
  const SpocDashboard({super.key});

  @override
  State<SpocDashboard> createState() => _SpocDashboardState();
}

class _SpocDashboardState extends State<SpocDashboard> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: screenHeight,
              width: screenWidth * 0.03,
              color: Colors.deepPurple,
            ),
            Container(
              height: screenHeight,
              width: screenWidth * 0.6,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Hey!",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Spoc Name",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Happy to see you again",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.5,
                    width: screenWidth * 0.5,
                    child: Stack(
                      children: [
                        Positioned(
                            top: screenHeight * 0.2,
                            left: screenWidth * 0.1,
                            child: GestureDetector(
                              onTap: () {
                               // Get.to(()=>);
                              },
                              child: Container(
                                height: screenHeight * 0.23,
                                width: screenWidth * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.orange,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20.0,
                                      bottom: 0,
                                      top: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Take a",
                                        style: TextStyle(
                                            fontSize: 24, color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 1,
                                      ),
                                      Text(
                                        "Exam",
                                        style: TextStyle(
                                            fontSize: 33,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        "Start Now",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                        Positioned(
                            top: screenHeight * 0.242,
                            left: screenWidth * 0.11,
                            child: Image.asset(
                              "assets/exam_icon.png",
                              height: screenHeight * 0.22,
                            )),
                        Positioned(
                            top: screenHeight * 0.2,
                            left: screenWidth * 0.35,
                            child: Container(
                              height: screenHeight * 0.23,
                              width: screenWidth * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.blue,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                    bottom: 0,
                                    top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Student",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Text(
                                      "Data",
                                      style: TextStyle(
                                          fontSize: 33,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 35,
                                    ),
                                    Text(
                                      "Check",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                    // Positioned(
                                    //   //top: screenHeight*0.04,
                                    //   left: screenWidth*0.2,
                                    //   child: Image.asset("assets/student_data.png",height: screenHeight*0.2,)),
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(height: screenHeight*0.02,),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Scheduled Exams :",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w900),
                      ))
                ],
              ),
            ),
            //////////////////////
            Container(
              height: screenHeight,
              width: screenWidth * 0.37,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: screenHeight * 0.08,
                    width: screenWidth * 0.19,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(18)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, right: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.settings,
                            color: Colors.black,
                            size: 34,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Icon(
                            Icons.notifications_none_rounded,
                            color: Colors.black,
                            size: 35,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Image.asset(
                            "assets/profile_icon.png",
                            height: 38,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.07,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                      height: screenHeight * 0.25,
                      width: screenWidth * 0.26,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        image: DecorationImage(
                            image: AssetImage("assets/announcment_bg.jpg"),
                            fit: BoxFit.cover,
                            opacity: 1.7),
                        color: Colors.deepPurple.withOpacity(0.1),
                      ),
                      child: Container(
                        height: screenHeight * 0.25,
                        width: screenWidth * 0.26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.black.withOpacity(0.7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, top: 20),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Announcement",
                                style: TextStyle(
                                    fontSize: 17.5, color: Colors.white),
                              ),
                              Spacer(),
                              Icon(
                                Icons.more_vert_rounded,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
