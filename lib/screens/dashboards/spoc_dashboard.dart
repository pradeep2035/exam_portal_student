// ignore_for_file: sized_box_for_whitespace, unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sat_exam_portal/controllers/spoc_data_controller.dart';
import 'package:sat_exam_portal/screens/registered_students.dart';
import 'package:sat_exam_portal/screens/spoc_question_creation.dart';

class SpocDashboard extends StatefulWidget {
  final String spocId;
  final String schoolId;
  const SpocDashboard({super.key, required this.spocId, required this.schoolId});

  @override
  State<SpocDashboard> createState() => _SpocDashboardState();
}

class _SpocDashboardState extends State<SpocDashboard> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSpocData();
  }

 List spocDetails=[];
 final SpocDataController spocd = Get.put(SpocDataController());

 fetchSpocData()async{
  try {
    List<dynamic> data = await spocd.fetchspocDetails(widget.spocId.toString());
    setState(() {
      spocDetails = data;
    });
    print(spocDetails);
  } catch (e) {
    print("Error fetching Spoc data: $e");
    // Handle error scenario
  }
 }
 
 

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child:spocDetails.isEmpty?Center(
          child: CircularProgressIndicator(),
        ): 
        Row(
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
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, top: 30),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Hey!",
                        style: GoogleFonts.workSans(
                            fontSize: 33, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                 
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        spocDetails[0]['spoc_name'].toString(),
                        style: GoogleFonts.workSans(
                            fontSize: 50, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Happy to see you again",
                        style: GoogleFonts.lato(
                          fontSize: 18,
                        ),
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
                                print("TAPPEDD");
                                Get.to(() => QuestionPaper());
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                            child: GestureDetector(
                              onTap: () {
                                //String schoolId=spocDetails[0]['spoc_name'].toString();
                                          Get.to(()=>RegisteredStudents(schoolId:widget.schoolId.toString()));
                              },
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
                              ),
                            ))
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
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
