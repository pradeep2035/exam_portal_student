// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, sized_box_for_whitespace, unused_import, file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sat_exam_portal/controllers/student_question_controller.dart';
import 'package:sat_exam_portal/screens/exam_portal/exam_portal_screen.dart';

class studentDashboard extends StatefulWidget {
  const studentDashboard({super.key});

  @override
  State<studentDashboard> createState() => _studentDashboardState();
}

class _studentDashboardState extends State<studentDashboard> {
  bool isFetched = false;
  final String school_id = "1122";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchExams();

  }
  final studentController student = Get.put(studentController());
   List<Map<String, dynamic>> questionBank = [];
  final TextEditingController searchController = TextEditingController();
  String level='';
  fetchExams()async{
    try {
      List<Map<String, dynamic>> data = await student.fetchExams(school_id);
      setState(() {
        questionBank = data;
        isFetched = true;
      });
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: !isFetched? Center(child: CircularProgressIndicator(color: Colors.black45,),):Container(
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
              padding: EdgeInsets.only(left: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 13,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Hey!",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Student Name",
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
                        "Good Luck for exam",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Divider(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Ongoing Exams :",
                        style:
                            TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 18),
                      height: screenHeight * 0.4,
                      width: screenWidth * 0.57,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Name',
                                  style: GoogleFonts.lato(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  'Duration',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  'Total marks',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  'Class',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: questionBank.length,
                              itemBuilder: (context, index) {
                                final item = questionBank[index];
                                return GestureDetector(
                                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>ExamPortalScreen(exam_id: item['_id'], exam_name: item['test_name'],total_marks: item['total_marks'],))),
                                  child: ListTemplate(
                                    test_name: item['test_name']!,
                                    duration: item['duration']!,
                                    total_marks: item['total_marks']!,
                                    marks: item['class']!,
                                  ),
                                );
                              },
                            ),
                          ),
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
                          "Upcoming Exams :",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w900),
                        ),
                        ),
                        
                    Container(
                      margin: EdgeInsets.only(top: 18),
                      height: screenHeight * 0.4,
                      width: screenWidth * 0.57,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Name',
                                  style: GoogleFonts.lato(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  'Duration',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  'Start time',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  'Total marks',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: upComingExamDataList.length,
                              itemBuilder: (context, index) {
                                final item = upComingExamDataList[index];
                                return ListTemplate(
                                  test_name: item['name']!,
                                  duration: item['duration']!,
                                  total_marks: item['startTime']!,
                                  marks: item['marks']!,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                              // Icon(
                              //   Icons.more_vert_rounded,
                              //   color: Colors.white,
                              // )
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

class ListTemplate extends StatelessWidget {
  final String test_name;
  final String duration;
  final String total_marks;
  final String marks;

  const ListTemplate({
    required this.test_name,
    required this.duration,
    required this.total_marks,
    required this.marks,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '$test_name',
            style: GoogleFonts.workSans(
                fontSize: 16.0, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 4.0),
          Text(
            '$duration',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 4.0),
          Text(
            '$total_marks',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 4.0),
          Text(
            '$marks',
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}

List<Map<String, String>> examDataList = [
  
  {
    'name': 'Hindi',
    'duration': '1.5 hours',
    'startTime': '11:00 AM',
    'marks': '75',
  },
  {
    'name': 'English',
    'duration': '3 hours',
    'startTime': '2:00 PM',
    'marks': '85',
  },
  {
    'name': 'Computer',
    'duration': '2 hours',
    'startTime': '9:00 AM',
    'marks': '80',
  },
  {
    'name': 'Chemistry',
    'duration': '3 hours',
    'startTime': '2:00 PM',
    'marks': '85',
  },
  {
    'name': 'Physics',
    'duration': '2 hours',
    'startTime': '9:00 AM',
    'marks': '80',
  },
  {
    'name': 'Hindi',
    'duration': '1.5 hours',
    'startTime': '11:00 AM',
    'marks': '75',
  },
  {
    'name': 'English',
    'duration': '3 hours',
    'startTime': '2:00 PM',
    'marks': '85',
  },
  {
    'name': 'Computer',
    'duration': '2 hours',
    'startTime': '9:00 AM',
    'marks': '80',
  },
  {
    'name': 'Chemistry',
    'duration': '3 hours',
    'startTime': '2:00 PM',
    'marks': '85',
  },
  // Add more data elements as needed
];


List<Map<String, String>> upComingExamDataList = [
  
  {
    'name': 'Hindi',
    'duration': '1.5 hours',
    'startTime': '11:00 AM',
    'marks': '75',
  },
  {
    'name': 'English',
    'duration': '3 hours',
    'startTime': '2:00 PM',
    'marks': '85',
  },
  {
    'name': 'Computer',
    'duration': '2 hours',
    'startTime': '9:00 AM',
    'marks': '80',
  },
  {
    'name': 'Chemistry',
    'duration': '3 hours',
    'startTime': '2:00 PM',
    'marks': '85',
  },
  {
    'name': 'Mathematics',
    'duration': '1.5 hours',
    'startTime': '11:00 AM',
    'marks': '75',
  },
  {
    'name': 'Social Science',
    'duration': '2 hours',
    'startTime': '9:00 AM',
    'marks': '80',
  },
  {
    'name': 'Sanskrit',
    'duration': '3 hours',
    'startTime': '2:00 PM',
    'marks': '85',
  },
  // Add more data elements as needed
];
