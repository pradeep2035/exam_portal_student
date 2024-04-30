import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sat_exam_portal/controllers/spoc_question_controller.dart';
class FinalQuestionPaperCreation extends StatefulWidget {
   final questionIdList;
  const FinalQuestionPaperCreation({super.key, this.questionIdList});

  @override
  State<FinalQuestionPaperCreation> createState() => _FinalQuestionPaperCreationState();
}

class _FinalQuestionPaperCreationState extends State<FinalQuestionPaperCreation> {
  final SpocController spc = Get.put(SpocController());
  TextEditingController examname = TextEditingController();
  TextEditingController examMarks = TextEditingController();
  TextEditingController className = TextEditingController();
  TextEditingController examDuration = TextEditingController();
  TextEditingController schoolId = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
        double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      title: Text('Exam Details',style: TextStyle(fontSize:19,color: Colors.deepPurple,fontWeight: FontWeight.w600),),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
             SizedBox(
            height: screenHeight*0.06,
            width: screenWidth*0.15,
            child: TextField(
            keyboardType: TextInputType.number,
            //maxLength: 6,
          controller: examname,
          cursorColor: Colors.deepPurple,
          decoration:InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            focusColor: Colors.deepPurple,
            hoverColor: Colors.deepPurple,
            focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.deepPurple, width: 2.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          hintText: "Exam Name",
          hintStyle:TextStyle(fontSize: 14) 
          ),
          ),
          ),
          SizedBox(width: 30,),
             SizedBox(
            height: screenHeight*0.06,
            width: screenWidth*0.15,
            child: TextField(
            keyboardType: TextInputType.number,
            //maxLength: 6,
          controller: examMarks,
          cursorColor: Colors.deepPurple,
          decoration:InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            focusColor: Colors.deepPurple,
            hoverColor: Colors.deepPurple,
            focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.deepPurple, width: 2.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          hintText: "Total Marks",
          hintStyle:TextStyle(fontSize: 14) 
          ),
          ),
          )
            ],
          ),
          SizedBox(height: 20,),
                  Row(
            children: [
             SizedBox(
            height: screenHeight*0.06,
            width: screenWidth*0.1,
            child: TextField(
            keyboardType: TextInputType.number,
            //maxLength: 6,
          controller: className,
          cursorColor: Colors.deepPurple,
          decoration:InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            focusColor: Colors.deepPurple,
            hoverColor: Colors.deepPurple,
            focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.deepPurple, width: 2.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          hintText: "Class",
          hintStyle:TextStyle(fontSize: 14) 
          ),
          ),
          ),
          SizedBox(width: 10,),
             SizedBox(
            height: screenHeight*0.06,
            width: screenWidth*0.1,
            child: TextField(
            keyboardType: TextInputType.number,
            //maxLength: 6,
          controller: examDuration,
          cursorColor: Colors.deepPurple,
          decoration:InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            focusColor: Colors.deepPurple,
            hoverColor: Colors.deepPurple,
            focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.deepPurple, width: 2.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          hintText: "Duration in hrs",
          hintStyle:TextStyle(fontSize: 14) 
          ),
          ),
          ),
          SizedBox(width: 10,),
             SizedBox(
            height: screenHeight*0.06,
            width: screenWidth*0.1,
            child: TextField(
            keyboardType: TextInputType.number,
            //maxLength: 6,
          controller: schoolId,
          cursorColor: Colors.deepPurple,
          decoration:InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            focusColor: Colors.deepPurple,
            hoverColor: Colors.deepPurple,
            focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.deepPurple, width: 2.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          hintText: "School ID",
          hintStyle:TextStyle(fontSize: 14) 
          ),
          ),
          )
            ],
          ),
          
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async{
            print(widget.questionIdList);
            await spc.createQuestionPaper(
              widget.questionIdList,
              schoolId.text.toString(),
              examname.text.toString(),
              examDuration.text.toString(),
              examMarks.text.toString(),
              className.text.toString(),
            );

            Get.back() ;// Close the dialog box
          },
          child: Text('Schedule Exam'),
        ),
      ],
    );;
  }
}