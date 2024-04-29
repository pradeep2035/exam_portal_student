import 'package:flutter/material.dart';

class ExamPortalScreen extends StatefulWidget {
  const ExamPortalScreen({super.key});

  @override
  State<ExamPortalScreen> createState() => _ExamPortalScreenState();
}

class _ExamPortalScreenState extends State<ExamPortalScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
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
                    height: screenHeight*0.08,
                    width: screenWidth*0.1,
                    decoration: BoxDecoration(
                    //color: Colors.white,
                    border: Border.all(width: 2,color: Colors.white),
                    borderRadius: BorderRadius.circular(14)
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(Icons.timer,color:Colors.white,),
                          Text("Duration :",style:TextStyle(color:Colors.white,fontWeight: FontWeight.w500,fontSize: 17.5)),
                        ],
                      ),
                    ),
                  ),
                  Text("Exam Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
              
                  Container(
                    height: screenHeight*0.08,
                    width: screenWidth*0.1,
                    decoration: BoxDecoration(
                    //color: Colors.white,
                    border: Border.all(width: 2,color: Colors.white),
                    borderRadius: BorderRadius.circular(14)
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(Icons.person,color:Colors.white,),
                          Text("Username",style:TextStyle(color:Colors.white,fontWeight: FontWeight.w500,fontSize: 17.5)),
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
                        border:
                            Border.all(width: 2.0, color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "Question:",
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
                        border:
                            Border.all(width: 2.0, color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
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
                        border:
                            Border.all(width: 2.0, color: Colors.deepPurple),
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
                        border:
                            Border.all(width: 2.0, color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
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
                        border:
                            Border.all(width: 2.0, color: Colors.deepPurple),
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
                                    color: Colors.red
                                  ),
                                ),
                                Text("Not Answered",style: TextStyle(color: Colors.black),)
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green
                                  ),
                                ),
                                Text("Answered",style: TextStyle(color: Colors.black),)
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue
                                  ),
                                ),
                                Text("Review",style: TextStyle(color: Colors.black),)
                              ],
                            ),
                          ],
                        )
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Container(
                      height: screenHeight * 0.6,
                      width: screenWidth * 0.3,
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 2.0, color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
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
              height: screenHeight*0.072,
              color: Colors.white,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: screenHeight*0.05,
                      width: screenHeight*0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple,
                      ),
                      child: Center(
                        child: Text("Previous",style:TextStyle(color: Colors.white,)),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: screenHeight*0.05,
                          width: screenHeight*0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Text("Review",style:TextStyle(color: Colors.white,)),
                          ),
                        ),
                        SizedBox(width: 50,),
                    Container(
                      height: screenHeight*0.05,
                      width: screenHeight*0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text("Clear Response",style:TextStyle(color: Colors.white,)),
                      ),
                    ),
                      ],
                    ),
                    Container(
                      height: screenHeight*0.05,
                      width: screenHeight*0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green,
                      ),
                      child: Center(
                        child: Text("Save & Next",style:TextStyle(color: Colors.white,)),
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
