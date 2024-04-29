import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sat_exam_portal/controllers/spoc_question_controller.dart';

class QuestionPaper extends StatefulWidget {
  const QuestionPaper({super.key});

  @override
  State<QuestionPaper> createState() => _QuestionPaperState();
}

class _QuestionPaperState extends State<QuestionPaper> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchQuestionBank();
  }
  final SpocController spc = Get.put(SpocController());
   List<Map<String, dynamic>> questionBank = [];
  final TextEditingController searchController = TextEditingController();
  String level='';
  fetchQuestionBank()async{
    try {
      List<Map<String, dynamic>> data = await spc.fetchData();
      setState(() {
        questionBank = data;
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
      body:Container(
      height:screenHeight,
      width: screenWidth,
      child: 
      Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
               Center(
                 child: SizedBox(
                   height: screenHeight*0.05,
                   width: screenWidth*0.2,
                   child: TextField(
                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.symmetric(vertical:10),
                       filled: true,
                       fillColor: Colors.grey[100],
                       hintText: 'Search',
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
                       prefixIcon: Icon(Icons.search),
                     ),
                   ),
                 ),
               ),
              SizedBox(height: 20,),
            Container(
              height: screenHeight*0.8,
              width: screenWidth*0.87,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0,color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(12)
              ),
              child: 
            questionBank.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : 
                  SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text('SUBJECT',style: TextStyle(color: Colors.black,fontSize: 17.8,fontWeight: FontWeight.w800))),
                          DataColumn(label: Text('QUESTION',style: TextStyle(color: Colors.black,fontSize: 17.8,fontWeight: FontWeight.w800))),
                          DataColumn(label: Text('ANSWER',style: TextStyle(color: Colors.black,fontSize: 17.8,fontWeight: FontWeight.w800))),
                          DataColumn(label: Text('DIFFICULTY',style: TextStyle(color: Colors.black,fontSize: 17.8,fontWeight: FontWeight.w800))),
                        ],
                        rows: questionBank
                            .map(
                              (question) => DataRow(
                                cells: [
                                  DataCell(Text(question['subject'],style: TextStyle(color: Colors.black,fontSize: 15.8,fontWeight: FontWeight.bold),)),
                                  DataCell(Text(
                                        question['question'].length > 60
                                        ? '${question['question'].substring(0,59)}...'
                                        : question['question'],
                                    overflow: TextOverflow.ellipsis,
                                  ),),
                                  DataCell(Text(question['answer'].length > 60
                                        ? '${question['answer'].substring(0,59)}...'
                                        : question['answer'],
                                    overflow: TextOverflow.ellipsis,)),
                                  DataCell(Text(level=question['difficulty_level'],style: TextStyle(
                                    color: level=="easy"?Colors.green:Colors.red
                                  ),),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
            ),
          ],
        ),
      )
      ),
    );
  }
}