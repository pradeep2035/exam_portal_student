import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sat_exam_portal/screens/auth/student_register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    bool _keepLoggedIn = false;
    String _selectedUser = 'Select user type';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
      width: screenWidth,
      height: screenHeight,
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.only(left:60.0,right: 30.0),
        child: Row(
         // mainAxisAlignment: MainAxisAlignment.spaceAround,
        // mainAxisSize: MainAxisSize.min,
          children: [
           Container(
           //margin: EdgeInsets.all(20),
            height: screenHeight*0.9,
            width: screenWidth*0.5,
            decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/login_photo.jpeg"),fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(22),
            ),
            child: Container(
            height: screenHeight*0.9,
            width: screenWidth*0.5,
            decoration: BoxDecoration(
            //image: DecorationImage(image: AssetImage("assets/login_photo.jpeg")),
            borderRadius: BorderRadius.circular(22),
            color: Colors.deepPurple.withOpacity(0.8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left:20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Text("Welcome to Upstair",style: TextStyle(fontSize: 18,color: Colors.white,),)),
                  SizedBox(height: screenHeight*0.01,),
                  Align(
                   alignment: AlignmentDirectional.bottomStart,
                    child: Text("Examination Portal",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white,),)),
                  SizedBox(
                    height: screenHeight*0.1,
                  )
                ],
              ),
            ),
            ),
           ),
          Expanded(
            child: Container(
                height: screenHeight,
                width: screenWidth*0.5,
                child: Padding(
                  padding:  EdgeInsets.only(left: screenWidth*0.1, right: screenWidth*0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/main_logo.png",height: screenHeight*0.19,),
                      Text("Upstair",style:TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: Colors.deepPurple),),
                      SizedBox(height: screenHeight*0.04,),
                     Align(
                      alignment:Alignment.centerLeft,
                      child:
                      Row(
                        children: [
                       Text("Hii",style: TextStyle(fontSize: 32,color: Colors.deepPurple,fontWeight:FontWeight.w800,letterSpacing: 1.0),),
                       Text(", will you sign in now",style: TextStyle(fontSize: 32,color: Colors.black,fontWeight:FontWeight.w800,letterSpacing: 1.0),)
                        ],
                      )
                       ),
                     SizedBox(height: screenHeight*0.01,),
                      Row(
                        children: [
                       Text("Don't have an account ?",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight:FontWeight.w800,letterSpacing: 1.0),),
                       GestureDetector(
                        onTap: () {
                          Get.to(()=>StudentRegistration());
                        },
                        child: Text("Sign Up",style: TextStyle(fontSize: 15,color: Colors.deepPurple,fontWeight:FontWeight.w800,letterSpacing: 1.0),))
                        ],
                      ),
                     
                      SizedBox(height: screenHeight*0.03,),
                      Container(
                        height: screenHeight*0.07,
                        child: InputDecorator(
                          decoration: InputDecoration(
                            //labelText: "User Type",
                            prefixIcon: Icon(Icons.person_outline_rounded),
                             filled: true,
                             fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              contentPadding:  EdgeInsets.symmetric(
                                  vertical: screenHeight*0.01,horizontal: 16),
                            ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              //icon: Icon(Icons.person_outline_rounded),
                              
                              value: _selectedUser,
                              hint: Text('Select user type',style: TextStyle(color: Colors.grey),),
                              onChanged: (value) {
                                setState(() {
                                  _selectedUser = value!;
                                });
                              },
                              items:["Select user type",'SPOC', 'Student']
                                  .map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                       SizedBox(height: screenHeight*0.02,),
                      TextField(
                      cursorColor: Colors.deepPurple,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: screenHeight*0.01),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.deepPurple, width: 2.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                          labelText:"Username",
                          prefixIcon: Icon(Icons.alternate_email_rounded),
                      ), 
                      ),
                     SizedBox(height: screenHeight*0.02,),
                      TextField(
                      cursorColor: Colors.deepPurple,
                      obscureText: true,
                      decoration: InputDecoration(
                     contentPadding: EdgeInsets.symmetric(vertical: screenHeight*0.01),
                        filled: true,
                        fillColor: Colors.white,
                      //focusColor: Colors.deepPurple,
                      //hoverColor: Colors.deepPurple,
                      focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.deepPurple, width: 2.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                        labelText:"Password",
                        prefixIcon: Icon(Icons.remove_red_eye_outlined),
                       ), 
                      ),
                      SizedBox(height: screenHeight*0.01,),
                      Row(
                        children: [
                          Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            activeColor: Colors.deepPurple,
                            checkColor: Colors.white,
                            hoverColor: Colors.deepPurple.shade100,
                            value: _keepLoggedIn,
                             onChanged: (value) { 
                              setState(() {
                                _keepLoggedIn = value!;
                              });
                            }, 
                          ),
                          Text("Keep me logged in",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500),),
                          Spacer(),
                          Text("Forgot Password?",style: TextStyle(fontSize: 15,color: Colors.deepPurple,fontWeight: FontWeight.w600),),

                        ],
                      ),
                      SizedBox(height: screenHeight*0.03,),
                      Container(
                        height: screenHeight*0.06,
                        //width:screenWidth*0.1,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Text("Login",style: TextStyle(fontSize: 14,color: Colors.white),)),
                      ),
                    ],
                  ),
                ),
              ),
          ),
          ],
        ),
      ),
      ),
    );
  }
}