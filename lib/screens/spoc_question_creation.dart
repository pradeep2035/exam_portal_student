import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sat_exam_portal/components/question_details_diaog.dart';
import 'package:sat_exam_portal/controllers/spoc_question_controller.dart';
import 'package:sat_exam_portal/screens/question_paper.dart';

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
    List<Map<String, dynamic>> filteredQuestionBank = [];
  String level='';
  List<String> selectedQuestionIds = [];
 
  
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
  void filterSearchResults(String query) async {
  if (query.isNotEmpty) {
    try {
      List<Map<String, dynamic>> searchResults = await spc.searchQuestion(query);
      setState(() {
        filteredQuestionBank = searchResults;
      });
    } catch (e) {
      print('Error searching: $e');
      setState(() {
        filteredQuestionBank = [];
      });
    }
  } else {
    setState(() {
      filteredQuestionBank = List.from(questionBank);
    });
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
            SizedBox(height: 5,),
               Center(
                 child: Padding(
                   padding: const EdgeInsets.only(left:20.0, right:20.0),
                   child: Row(
                   // mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                     children: [
                      Row(
                          children: [
                            Image.asset("assets/main_logo.png",height: screenHeight*0.08,),
                            Text("Upstair",style: TextStyle(fontSize:19,fontWeight: FontWeight.w900,color: Colors.black),),
                          ],
                        ),
                        Spacer(),
                       SizedBox(
                         height: screenHeight*0.05,
                         width: screenWidth*0.2,
                         child: TextField(
                          controller:searchController ,
                          onChanged: (value) {
                            filterSearchResults(value);
                          },
                           decoration: InputDecoration(
                             contentPadding: EdgeInsets.symmetric(vertical:10),
                             filled: true,
                             fillColor: Colors.grey[100],
                             hintText: 'Search subject or topic',
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
                       Spacer(),
                       selectedQuestionIds.toString().isEmpty?
                       Container(
                        height: 40,
                        width: 80,
                        color: Colors.deepPurple,
                        child: Center(
                          child: Text("Submit",style: TextStyle(color: Colors.white),),
                        ),
                       ):
                         GestureDetector(
                          onTap:(){
                          print("+++++++++++++++++++++++++++++++++++++++++++++++++++");
                        print(selectedQuestionIds);
                        Get.to(FinalQuestionPaperCreation(questionIdList:selectedQuestionIds));
                          } ,
                           child: Container(
                                height: 40,
                                width: 80,
                                color: Colors.deepPurple,
                                child: Center(
                            child: Text("Submit",style: TextStyle(color: Colors.white),),
                          ),
                          ),
                         )
                     ],
                   ),
                 ),
               ),
             // SizedBox(height: 5,),
              
              Padding(
                padding: const EdgeInsets.only(right:50.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text("Selected Questions: ${selectedQuestionIds.length.toString()}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
              ),
              SizedBox(height: 2,),

            Container(
              height: screenHeight*0.87,
              width: screenWidth*0.94,
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
                          DataColumn(label: Text('WATCH', style: TextStyle(color: Colors.black, fontSize: 17.8, fontWeight: FontWeight.w800))), 
                          DataColumn(label: Text('ADD', style: TextStyle(color: Colors.black, fontSize: 17.8, fontWeight: FontWeight.w800))), 
                        ],
                        rows:  searchController.text.isEmpty ? // Check if search field is empty
                    questionBank
                      .map(
                        (question) => DataRow(
                          cells: [
                            DataCell(Text(question['subject'], style: TextStyle(color: Colors.black, fontSize: 15.8, fontWeight: FontWeight.bold))),
                            DataCell(Text(
                              question['question'].length > 60 ? '${question['question'].substring(0, 59)}...' : question['question'],
                              overflow: TextOverflow.ellipsis,
                            )),
                            DataCell(Text(
                              question['answer'].length > 60 ? '${question['answer'].substring(0, 59)}...' : question['answer'],
                              overflow: TextOverflow.ellipsis,
                            )),
                            DataCell(Text(
                              level = question['difficulty_level'],
                              style: TextStyle(color: level == "easy" ? Colors.green : Colors.red),
                            )),
                            DataCell(IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () async{
                              String questionId=question['_id'];
                                await spc.fetchQuestionById(questionId);
                                Map<String, dynamic>? questionDetails = await spc.fetchQuestionById(questionId);
                                if (questionDetails != null) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return QuestionDialog(questionDetails: questionDetails);
                                    },
                                  );
                                } else {
                                  print("errorrrrrrrrr");
                                }
                              },
                            )),
                            DataCell(IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                String questionId=question['_id'];
                                selectedQuestionIds.add(questionId);
                              },
                            )),
                          ],
                        ),
                      )
                      .toList()
                    : filteredQuestionBank // Show search results if search field is not empty
                      .map(
                        (question) => DataRow(
                          cells: [
                            DataCell(Text(question['subject'], style: TextStyle(color: Colors.black, fontSize: 15.8, fontWeight: FontWeight.bold))),
                            DataCell(
                              Text(
                              question['question'].length > 60 ? '${question['question'].substring(0, 59)}...' : question['question'],
                              overflow: TextOverflow.ellipsis,
                            )),
                            DataCell(Text(
                              question['answer'].length > 60 ? '${question['answer'].substring(0, 59)}...' : question['answer'],
                              overflow: TextOverflow.ellipsis,
                            )),
                            DataCell(Text(
                              level = question['difficulty_level'],
                              style: TextStyle(color: level == "easy" ? Colors.green : Colors.red),
                            )),
                            DataCell(IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                // Handle adding question here
                              },
                            )),
                            DataCell(IconButton(
                              icon: 
                              // If selected, show Tick icon
                               Icon(Icons.add),
                              onPressed: () {
                                String questionId=question['_id'];
                                selectedQuestionIds.add(questionId);
                                // Handle adding question here
                              },
                            )),
                          ],
                        ),
                      )
                      .toList(),
                ),
              )
                                  
            ),
          ],
        ),
      )
      ),
    );
  }
}