import 'package:flutter/material.dart';

class RowTextfield extends StatelessWidget {
  final String text1;
  final String text2;
  final TextEditingController controller1;
  final TextEditingController controller2;
  final String hintText1;
  final String hintText2;
  final maxlength1;
  final maxlength2;
  const RowTextfield({super.key,required this.text1, required this.text2, required this.controller1, required this.controller2, required this.hintText1, required this.hintText2, this.maxlength1, this.maxlength2});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text1,style: TextStyle(fontSize: 18),),
                SizedBox(height: 8,),
                SizedBox(
                  height: screenHeight*0.05,
                  width: screenWidth*0.25,
                  child: TextField(
                  controller:controller1 ,
                  maxLength: maxlength1,
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
                  hintText: hintText1,
                  hintStyle:TextStyle(fontSize: 14) 
                  ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text2,style: TextStyle(fontSize: 18),),
                SizedBox(height: 8,),
                SizedBox(
                  height: screenHeight*0.05,
                  width: screenWidth*0.25,
                  child: TextField(
                  controller:controller2 ,
                  maxLength: maxlength2,
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
                    hintText:hintText2,
                    hintStyle:TextStyle(fontSize: 14) 
                    ),
                                        
                    ),
                ),
                ],
              ),
      
            ],
          );
  }
}

// TextField(
//                     cursorColor: Colors.deepPurple,
//                     decoration: InputDecoration(
//                     focusColor: Colors.deepPurple,
//                     hoverColor: Colors.deepPurple,
//                     focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide(color: Colors.deepPurple, width: 2.5),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                         labelText:"Username",
//                         suffixIcon: Icon(Icons.person_outline_rounded),
//                     ), 
//                     ),