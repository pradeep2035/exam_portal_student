
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sat_exam_portal/components/textfields.dart';
import 'package:sat_exam_portal/components/timeline_student_register.dart';
import 'package:intl/intl.dart';


class StudentRegistration extends StatefulWidget {
  const StudentRegistration({super.key});

  @override
  State<StudentRegistration> createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController fatherName = TextEditingController();
  TextEditingController fatherMobile = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController studentMobile = TextEditingController();
  TextEditingController studentMail = TextEditingController();
  TextEditingController schoolId = TextEditingController();
  TextEditingController otp = TextEditingController();
  bool optpage=false;
  bool isPast=false;
  bool isSubmitButton=false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body:ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset("assets/main_logo.png",height: screenHeight*0.08,),
                Text("Upstair",style: TextStyle(fontSize:19,fontWeight: FontWeight.w900,color: Colors.black),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:150.0,right: 150.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      height: screenHeight*0.47,
                      width: screenWidth*0.3,
                      child: ListView(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children:[
                          SizedBox(height: screenHeight*0.2,),
                          Text("Student",style: TextStyle(fontSize:50,fontWeight: FontWeight.w900,color: Colors.black),),
                          Text("Registraion",style: TextStyle(fontSize:50,fontWeight: FontWeight.w900,color: Colors.black),),
                          Text("Form",style: TextStyle(fontSize:50,fontWeight: FontWeight.w900,color: Colors.black),),
                        ],
                      ),
                    ),
                  ),
                  //Spacer(),
                   SvgPicture.asset("assets/student_registration.svg",height: screenHeight*0.75,)
                 // Image.asset("assets/student_registration.svg",height: screenHeight*0.44,),
                ],
              ),
          ),
          Divider(color: Colors.grey.shade500,),
        SizedBox(height: screenHeight*0.04,),
        Padding(
          padding: const EdgeInsets.only(left:30.0,right: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: screenHeight*0.5,
                width: screenWidth*0.2,
                child: Column(
                  children: [
                    StudentRegisterTimeline(
                      isFirst: true, 
                      isLast: false, 
                      isPast: true,
                      eventCard: Text("Student Information",style: TextStyle(fontSize: 16.5,color: Colors.white),)),
                    StudentRegisterTimeline(
                      isFirst: false, 
                      isLast: true, 
                      isPast: false,
                      eventCard: Text("Authentication",style: TextStyle(fontSize: 16.5,color: Colors.white)),),
                  ],
                ),
              ),
              Container(
                height: screenHeight*0.5,
                width: 1,
                color: Colors.grey.shade500,
              ),
              Container(
                height: screenHeight*0.67,
                width: screenWidth*0.6,
                //color: Colors.grey,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2.0,color: Colors.deepPurple.shade300),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.5), // Light deep purple color with opacity
                    blurRadius: 12, // Spread radius to control the size of the shadow
                    spreadRadius: 4, // Spread radius to control the size of the shadow
                    offset: Offset(0, 4), // Offset of the shadow
                  ),
                ],
                ),
                child:optpage?
                Padding(
                  padding: const EdgeInsets.only(left:35.0,right: 35.0,top: 15.0,bottom: 10.0),
                  child: ListView(
                    children: [
                      Text("Authentication",style:TextStyle(fontWeight: FontWeight.w900,fontSize: 16)),
                      SizedBox(height: 10,),
                        Text("We have sent you an 6-digit OTP on your given Mobile Number +91-${studentMobile.text.toString()}.",
                        style: TextStyle(color: Colors.grey.shade600,letterSpacing:0.8,fontWeight: FontWeight.w500,fontSize: 13),),
                        SizedBox(height: screenHeight*0.2,),
                        Center(
                          child: SizedBox(
                            height: screenHeight*0.06,
                            width: screenWidth*0.15,
                            child: TextField(
                            keyboardType: TextInputType.number,
                            //maxLength: 6,
                          controller: otp,
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
                          hintText: "Enter 6-digit OTP",
                          hintStyle:TextStyle(fontSize: 14) 
                          ),
                          ),
                          )
                        )
                    ],
                  ),
                )
                :
                 Padding(
                   padding: const EdgeInsets.only(left:35.0,right: 35.0,top: 15.0,bottom: 10.0),
                   child: ListView(
                    children: [
                      Row(children: [
                        Icon(Icons.info,size: 30,color: Colors.grey.shade600,),
                        SizedBox(width: 10,),
                        Text("Student  Information",style:TextStyle(fontWeight: FontWeight.w900,fontSize: 16),)
                      ],),
                      SizedBox(height: 10,),
                      Text("All information provided will kept confidential. We will not disclode your personal information to any third party without your consent.",
                      style: TextStyle(color: Colors.grey.shade600,letterSpacing:0.8,fontWeight: FontWeight.w500,fontSize: 14),),
                      SizedBox(height: 10,),
                      RowTextfield(text1: "First Name", controller1: firstname, hintText1: "Enter your first Name", hintText2: 'Enter your last Name', text2: 'Last Name', controller2:lastname,),
                      SizedBox(height: 10,),
                      RowTextfield(text1: "Father's Name", controller1: fatherName, hintText1: "Enter your father's Name", hintText2: 'Enter Mobile No. ', text2: "Enter father's Mobile No.", controller2:fatherMobile,),
                      SizedBox(height: 10,),
                      Row(
                      children: [
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Date of Birth",style: TextStyle(fontSize: 18),),
                            SizedBox(height: 8,),
                            SizedBox(
                              height: screenHeight*0.05,
                              width: screenWidth*0.25,
                              child: TextField(
                              controller:dob ,
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
                              hintText: "dd/mm/yyyy",
                              hintStyle:TextStyle(fontSize: 14) ,
                              suffixIcon:Icon(Icons.calendar_month_sharp),
                              ),
                              onTap: () async{
                                DateTime? pickeddate= await showDatePicker(
                                  context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2101));
                                  if (pickeddate!=null){
                                    setState(() {
                                      dob.text =DateFormat('dd-MM-yyyy').format(pickeddate);
                                    });
                                  }
                              },
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Gender",style: TextStyle(fontSize: 18),),
                            SizedBox(height: 8,),
                            SizedBox(
                              height: screenHeight*0.05,
                              width: screenWidth*0.25,
                              child: TextField(
                              //controller:controller2 ,
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
                                hintText:"Male/Female/Others",
                                hintStyle:TextStyle(fontSize: 14) 
                                ),
                                                    
                                ),
                            ),
                            ],
                          ),
                  
                        ],
                      ),
                      SizedBox(height: 10,),
                      RowTextfield(text1: "Mobile No.", controller1: studentMobile, hintText1: "10-Digit Mobile No.", hintText2: 'Enter your Email Address', text2: 'Email Address', controller2:studentMail,),
                      SizedBox(height: 10,),
                      Align(
                        alignment: AlignmentDirectional.bottomStart,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("School ID",style: TextStyle(fontSize: 18),),
                              SizedBox(height: 8,),
                                   SizedBox(
                                    height: screenHeight*0.05,
                                    width: screenWidth*0.1,
                                    child: TextField(
                                    controller:schoolId ,
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
                                    hintStyle:TextStyle(fontSize: 14) ,
                                    ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      ],
                      ),
                      ),
                      ),
                      
                    ],
                  ),
                ),
                SizedBox(height: screenHeight*0.03,),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth*0.84),
                  child: SizedBox(
                    height: screenHeight*0.035,
                    width: screenWidth*0.09,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                      optpage=true;
                     // isPast=true;
                      isSubmitButton=true;
                    });
                      },
                      child: Row(
                        children: [
                          Text(isSubmitButton?"Verify": "Proceed for Authentication",style:TextStyle(fontSize: 16,color: Colors.deepPurple,fontWeight: FontWeight.w600),),
                          Icon(Icons.arrow_forward_outlined,color: Colors.deepPurple,)
                        ],
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 10,),
              Container(
              height: screenHeight*0.07,
              width: screenWidth,
              color: Colors.deepPurple,
              )  
              ],
              ) ,
              
            );
          }
        }