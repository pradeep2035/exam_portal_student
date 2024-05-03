// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_transition_mixin.dart';
import 'package:sat_exam_portal/controllers/question_paper_controller.dart';
import 'package:sat_exam_portal/screens/auth/login.dart';
import 'package:sat_exam_portal/screens/dashboards/student_dashboard.dart';

class ExamPortalScreen extends StatefulWidget {
  final exam_id;
  final exam_name;
  final total_marks;
  final duration;
  final studentId;
  const ExamPortalScreen({
    Key? key,
    required this.exam_id,
    required this.exam_name,
    required this.total_marks, this.duration, this.studentId,
  }) : super(key: key);

  @override
  State<ExamPortalScreen> createState() => _ExamPortalScreenState();
}

class _ExamPortalScreenState extends State<ExamPortalScreen> {
  bool isFetched = false;
  String questions = "Example questions";
  List<String> options = ["opt1", "opt2", "opt3", "opt4"];
  var selectedQuestionIndex = 0;
  var selectedOptionIndex;
  List<String> selectedAnswers = [];
  List<String> correctAnswers = [];
  List<bool> viewedQuestions = [];
  List<int> actionPerformedOnQuestions = [];
  double total_mark = 0.0;
  int total_correct_answer = 0;
  double single_mark = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    total_mark = double.parse(widget.total_marks);
    fetchExams();
  }

  final QuestionPaperController student = Get.put(QuestionPaperController());
  List<Map<String, dynamic>> questionBank = [];
  final TextEditingController searchController = TextEditingController();
  String level = '';
  fetchExams() async {
    try {
      List<Map<String, dynamic>> data =
          await student.fetchQuestionPaper(widget.exam_id);
      setState(() {
        questionBank = data;
        for (var i = 0; i < questionBank.length; i++) {
          selectedAnswers.add("");
          viewedQuestions.add(false);
          actionPerformedOnQuestions.add(0);
          correctAnswers
              .add(questionBank[i]['answer'].toString().trim().toUpperCase());
        }
        viewedQuestions[0] = true;
        actionPerformedOnQuestions[0] = 2;
        questions = questionBank[0]['question'];
        options = List<String>.from(questionBank[0]['options']).toList();
        isFetched = true;
        single_mark = total_mark / questionBank.length;
      });
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.exam_id);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: !isFetched
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black87,
              ),
            )
          : Container(
              height: screenHeight,
              width: screenWidth,
              color: Colors.grey.shade300,
              child: ListView(
                children: [
                  Container(
                    height: screenWidth * 0.07,
                    width: screenWidth,
                    color: Colors.deepPurple,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: screenHeight * 0.08,
                              width: screenWidth * 0.14,
                              decoration: BoxDecoration(
                                  //color: Colors.white,
                                  border:
                                      Border.all(width: 2, color: Colors.white),
                                  borderRadius: BorderRadius.circular(14)),
                              child: Center(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width:6),
                                    Text(
                                      "Duration : ${widget.duration} hrs",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17.5),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              "${widget.exam_name.toString().toUpperCase()}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            Container(
                              height: screenHeight * 0.08,
                              width: screenWidth * 0.1,
                              decoration: BoxDecoration(
                                  //color: Colors.white,
                                  border:
                                      Border.all(width: 2, color: Colors.white),
                                  borderRadius: BorderRadius.circular(14)),
                              child: Center(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width:6),
                                    Text(widget.studentId.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17.5)),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.06,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: screenHeight * 0.07,
                            width: screenWidth * 0.3,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2.0, color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                "Question:${selectedQuestionIndex + 1}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Container(
                            padding: EdgeInsets.all(25),
                            height: screenHeight * 0.6,
                            width: screenWidth * 0.3,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2.0, color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                            child: Text(
                               questions,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: const Color.fromARGB(255, 33, 33, 33),
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: screenHeight * 0.07,
                            width: screenWidth * 0.3,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2.0, color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                "Options",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Container(
                              height: screenHeight * 0.6,
                              width: screenWidth * 0.3,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2.0, color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              child: ListView.builder(
                                itemCount: options.length,
                                itemBuilder: (context, index) {
                                  final Options = options[index];
                                  return ListTile(
                                    title: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedOptionIndex = index;
                                          selectedAnswers[
                                              selectedQuestionIndex] = Options;
                                          // actionPerformedOnQuestions[selectedQuestionIndex] = 1;
                                        });
                                      },
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2.0,
                                                  color: selectedOptionIndex ==
                                                          index
                                                      ? Colors.greenAccent
                                                      : Color.fromARGB(
                                                          255, 76, 76, 76)),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              color: selectedAnswers[
                                                          selectedQuestionIndex] ==
                                                      Options
                                                  ? Colors.greenAccent
                                                  : selectedOptionIndex == index
                                                      ? Colors.greenAccent
                                                      : Colors.transparent),
                                          child: Text(Options)),
                                    ),
                                  );
                                },
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: screenHeight * 0.07,
                            width: screenWidth * 0.3,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2.0, color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red),
                                    ),
                                    Text(
                                      "Not Answered",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green),
                                    ),
                                    Text(
                                      "Answered",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.deepPurple),
                                    ),
                                    Text(
                                      "Review",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ],
                            )),
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Container(
                            height: screenHeight * 0.6,
                            width: screenWidth * 0.3,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2.0, color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                            // add listView.builder
                            child: // questions boxes
                                // Add a ListView.builder here
                                ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: questionBank.length,
                              itemBuilder: (context, index) {
                                final questionList = questionBank[index];
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      // Update selected index and question/options variables
                                      selectedQuestionIndex = index;
                                      selectedOptionIndex = null;
                                      viewedQuestions[selectedQuestionIndex] =
                                          true;
                                      if (actionPerformedOnQuestions[index] ==
                                          0) {
                                        actionPerformedOnQuestions[
                                            selectedQuestionIndex] = 2;
                                      }
                                      // print(questionBank);
                                      questions = questionList['question'];
                                      options = List<String>.from(
                                              questionList['options'])
                                          .toList();
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 30,
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      margin: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        color: selectedQuestionIndex == index
                                            ? Colors.grey
                                            : actionPerformedOnQuestions[
                                                        index] ==
                                                    1
                                                ? Colors.green
                                                : actionPerformedOnQuestions[
                                                            index] ==
                                                        2
                                                    ? Colors.red
                                                    : actionPerformedOnQuestions[
                                                                index] ==
                                                            3
                                                        ? Colors.deepPurple
                                                        : Colors.transparent,
                                      ),
                                      child: Center(
                                          child: Text(
                                        "${index + 1}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.072,
                    color: Colors.white,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedQuestionIndex > 0) {
                                  --selectedQuestionIndex;
                                  selectedOptionIndex = null;
                                  questions =
                                      questionBank[selectedQuestionIndex]
                                          ['question'];
                                  options = List<String>.from(
                                          questionBank[selectedQuestionIndex]
                                              ['options'])
                                      .toList();
                                }
                              });
                            },
                            child: Container(
                              height: screenHeight * 0.05,
                              width: screenHeight * 0.15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: selectedQuestionIndex == 0
                                    ? const Color.fromARGB(255, 96, 134, 200)
                                    : Colors.blue,
                              ),
                              child: Center(
                                child: Text("Previous",
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (selectedAnswers[
                                            selectedQuestionIndex] !=
                                        "") {
                                      actionPerformedOnQuestions[
                                          selectedQuestionIndex] = 3;
                                      if (selectedQuestionIndex <
                                          questionBank.length - 1) {
                                        ++selectedQuestionIndex;
                                        if (actionPerformedOnQuestions[
                                                selectedQuestionIndex] ==
                                            0) {
                                          actionPerformedOnQuestions[
                                              selectedQuestionIndex] = 2;
                                        }
                                        selectedOptionIndex = null;
                                        questions =
                                            questionBank[selectedQuestionIndex]
                                                ['question'];
                                        options = List<String>.from(
                                                questionBank[
                                                        selectedQuestionIndex]
                                                    ['options'])
                                            .toList();
                                      }
                                    }
                                  });
                                },
                                child: Container(
                                  height: screenHeight * 0.05,
                                  width: screenHeight * 0.15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: actionPerformedOnQuestions[
                                                    selectedQuestionIndex] ==
                                                1 ||
                                            actionPerformedOnQuestions[
                                                    selectedQuestionIndex] ==
                                                3
                                        ? Colors.deepPurple
                                        : selectedOptionIndex == null
                                            ? const Color.fromARGB(
                                                255, 138, 131, 157)
                                            : Colors.deepPurple,
                                  ),
                                  child: Center(
                                    child: Text(
                                        selectedQuestionIndex !=
                                                questionBank.length - 1
                                            ? "Review & Next"
                                            : "Review",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    actionPerformedOnQuestions[
                                        selectedQuestionIndex] = 2;
                                    selectedAnswers[selectedQuestionIndex] = "";
                                    selectedOptionIndex = null;
                                  });
                                },
                                child: Container(
                                  height: screenHeight * 0.05,
                                  width: screenHeight * 0.15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: actionPerformedOnQuestions[
                                                    selectedQuestionIndex] ==
                                                1 ||
                                            actionPerformedOnQuestions[
                                                    selectedQuestionIndex] ==
                                                3
                                        ? Colors.red
                                        : selectedOptionIndex == null
                                            ? Color.fromARGB(255, 163, 70, 70)
                                            : Colors.red,
                                  ),
                                  child: Center(
                                    child: Text("Clear Response",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedAnswers[selectedQuestionIndex] !=
                                    "") {
                                  actionPerformedOnQuestions[
                                      selectedQuestionIndex] = 1;
                                  if (selectedQuestionIndex <
                                      questionBank.length - 1) {
                                    ++selectedQuestionIndex;
                                    if (actionPerformedOnQuestions[
                                            selectedQuestionIndex] ==
                                        0) {
                                      actionPerformedOnQuestions[
                                          selectedQuestionIndex] = 2;
                                    }
                                    selectedOptionIndex = null;
                                    questions =
                                        questionBank[selectedQuestionIndex]
                                            ['question'];
                                    options = List<String>.from(
                                            questionBank[selectedQuestionIndex]
                                                ['options'])
                                        .toList();
                                  } else {
                                    print(selectedAnswers);
                                    print(correctAnswers);
                                    for (var i = 0;
                                        i < questionBank.length;
                                        i++) {
                                      if (selectedAnswers[i]
                                              .toString()
                                              .trim()
                                              .toUpperCase() ==
                                          correctAnswers[i]) {
                                        ++total_correct_answer;
                                        print(true);
                                      } else {
                                        print(false);
                                      }
                                    }
                                    print(
                                        "total marks obtained ${single_mark * total_correct_answer}");
                                    if (selectedAnswers.isNotEmpty &&
                                        correctAnswers.isNotEmpty) {
                                      int totalCorrectAnswers = 0;
                                      for (var i = 0;
                                          i < questionBank.length;
                                          i++) {
                                        if (selectedAnswers[i]
                                                .toString()
                                                .trim()
                                                .toUpperCase() ==
                                            correctAnswers[i]) {
                                          totalCorrectAnswers++;
                                        }
                                      }

                                      double percentage = totalCorrectAnswers /
                                          questionBank.length;
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return ResultPopupCard(percentage);
                                        },
                                      );
                                    }
                                  }
                                }
                              });
                            },
                            child: Container(
                              height: screenHeight * 0.05,
                              width: screenHeight * 0.15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: actionPerformedOnQuestions[
                                                selectedQuestionIndex] ==
                                            1 ||
                                        actionPerformedOnQuestions[
                                                selectedQuestionIndex] ==
                                            3
                                    ? const Color.fromARGB(255, 47, 211, 52)
                                    : selectedOptionIndex == null
                                        ? Color.fromARGB(255, 103, 176, 117)
                                        : const Color.fromARGB(
                                            255, 47, 211, 52),
                              ),
                              child: Center(
                                child: Text(
                                  selectedQuestionIndex !=
                                          questionBank.length - 1
                                      ? "Save & Next"
                                      : "Save & Submit",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

class ResultPopupCard extends StatelessWidget {
  final double percentage;

  ResultPopupCard(this.percentage);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Result'),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
  width: 100.0,
  height: 100.0,
              child: CircularProgressIndicator(
                value: percentage,
                backgroundColor: Colors.grey, // Background color
                color: Colors.blue, // Progress color
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.deepPurple), // Animation for value color
                strokeWidth: 12.0, // Width of the progress bar
                semanticsLabel: 'Loading', // Accessibility label
                semanticsValue: '50%', // Accessibility value
                strokeCap: StrokeCap.round,
              ),
            ),
            SizedBox(height: 20),
            Text('Marks Obtained: ${(percentage * 100).toInt()}%'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Get.off(()=>LoginPage());
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
