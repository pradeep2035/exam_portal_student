import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sat_exam_portal/controllers/spoc_data_controller.dart';

class RegisteredStudents extends StatefulWidget {
  final String schoolId;
  const RegisteredStudents({super.key, required this.schoolId});

  @override
  State<RegisteredStudents> createState() => _RegisteredStudentsState();
}

class _RegisteredStudentsState extends State<RegisteredStudents> {
  late List<Map<String, dynamic>> registeredStudentList= [];
   final SpocDataController spocd = Get.put(SpocDataController());
  
  @override
  void initState() {
    super.initState();
    fetchRegisteredStudents();
  }
  
  
   fetchRegisteredStudents()async{
    try {
      List<Map<String, dynamic>> data = await spocd.fetchRegisteredStudents(widget.schoolId.toString());
      setState(() {
        registeredStudentList = data;
      });
      print(registeredStudentList);
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
      body: Container(
      height: screenHeight,
      width: screenWidth,
      child: Row(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth*0.04,
            color: Colors.deepPurple,
          ),
          Container(
            height: screenHeight,
            width: screenWidth*0.95,
           // color: Colors.grey,
            child: Column(
              children: [
                Padding(
                   padding: const EdgeInsets.only(left:20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      height: screenHeight*0.1,
                      width: screenWidth*0.2,
                      child: Row(
                        children: [
                          Image.asset("assets/main_logo.png",height: 65,),
                          SizedBox(width: 5,),
                          Text("Upstair",style: GoogleFonts.ubuntu(fontSize:30,fontWeight:FontWeight.w800),)
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:20.0,top:30),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Registered Student",style: GoogleFonts.workSans(fontSize:40,fontWeight:FontWeight.w700),)),
                    ),
                    Container(
                      height: screenHeight*0.06,
                      width: screenWidth*0.17,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.5,color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12)

                      ),
                      child: Center(
                        child: Text("SCHOOL ID:${widget.schoolId} ",style:GoogleFonts.workSans(fontSize:16,fontWeight:FontWeight.bold)),
                      ),
                    )
                  ],
                ),
                Divider(indent: 15,endIndent: 15,color: Colors.grey.shade300,),
                SizedBox(height: 20,),
                Container(
              height: screenHeight*0.7,
              width: screenWidth*0.6,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0,color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(12)
              ),
              child: 
                 registeredStudentList.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : 
                  SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text('Student ID',style: GoogleFonts.lato(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w900))),
                          DataColumn(label: Text('Student Name',style: GoogleFonts.lato(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w900))),
                          DataColumn(label: Text('Class',style: GoogleFonts.lato(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w900))),
                          DataColumn(label: Text('Contact Number',style: GoogleFonts.lato(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w900))),
                          DataColumn(label: Text("Father's Name", style: GoogleFonts.lato(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w900))), 
                          DataColumn(label: Text('Verification', style: GoogleFonts.lato(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w900))), 
                        ],
                        rows:  // Check if search field is empty
                    registeredStudentList
                      .map(
                        (student) => DataRow(
                          cells: [
                            DataCell(Text(student['student_id'] ?? '', style: TextStyle(color: Colors.black, fontSize: 15, ))),
                            DataCell(Text(student['student_name']?.toString() ?? '', style: TextStyle(color: Colors.black, fontSize: 15, ))),
                            DataCell(Text(student['class'] ?? '', style: TextStyle(color: Colors.black, fontSize: 15,))),
                            DataCell(Text(student['contact_no'] ?? '', style: TextStyle(color: Colors.black, fontSize: 15, ))),
                            DataCell(Text(student['fathers_name'] ?? '', style: TextStyle(color: Colors.black, fontSize: 15,))),
                            DataCell(Text(student['Verified'] ?? '', style: TextStyle(color: Colors.black, fontSize: 15,))),
                          ],
                        ),
                      )
                      .toList()
                      ),
                  )
                )

              ],
            ),
          )
        ],
      ),
      ),
    );
  }
}