import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sat_exam_portal/screens/auth/login.dart';

import '../api_value.dart';

class StudentController extends GetxController {
  Dio dio =Dio();
  FirebaseAuth _auth = FirebaseAuth.instance;
   String? storedVerificationId;

  // Function to send OTP to the user's phone number
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: "+91$phoneNumber",
      verificationCompleted: (PhoneAuthCredential credential) async {
        // This callback will be called automatically in some cases where the verification is completed instantly
        // For example, when the user signs in using their Google account
        // You can handle these cases as needed
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle the verification failure
        print('Verification Failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Store the verification ID somewhere, you'll need it later to verify the OTP
        // You can also use resendToken to implement resending OTP functionality
        // For now, let's assume you're storing the verification ID in a variable named 'storedVerificationId'
         storedVerificationId = verificationId;
        print('OTP has been sent to $phoneNumber');
        // Now you can navigate to the OTP verification screen and pass the verification ID
        // Get.to(() => OTPVerificationScreen(verificationId: storedVerificationId));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // This callback will be called when the code auto-retrieval has timed out
        // You can use this callback to handle cases where the user didn't receive the OTP
        print('Code Auto-Retrieval Timeout: $verificationId');
      },
    );
  }

  // Function to verify the OTP entered by the user
   Future<void> verifyOTP(String otp) async {
    try {
      // Check if the verificationId is not null
      if (storedVerificationId != null) {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: storedVerificationId!, smsCode: otp);
        UserCredential authResult = await _auth.signInWithCredential(credential);
        // If authentication is successful, you can proceed with your registration process
        // Handle the successful authentication as needed
   
        print('Authentication Successful: ${authResult.user!.phoneNumber}');
      } else {
        // Handle case where verificationId is null
        print('Verification ID is null. Unable to verify OTP.');
      }
    } catch (e) {
      // Handle authentication failure
      print('Authentication Failed: $e');
    }
  }


//==============================================================REGISTRATION =================================
  registerStudentInfo(String schoolId,studentName,classData,fatherName,dob,contactNumber,studentId,password) async {
  try {
    // Make API call to submit question IDs
    print("hello");
    final response = await dio.post(apiValue.studentRegistrationUrl, 
    data:{
          "school_id": schoolId,
          "student_name": studentName,
          "class": classData,
          "fathers_name": fatherName,
          "dob":dob,
          "contact_no": contactNumber,
          "student_id": studentId,
          "password": password
        }
        
    );
    if (response.statusCode == 200) {
      print("successfully REGISTRED ");
      Get.to(()=>LoginPage());
    } else {
      throw Exception('Failed to submit data');
    }
  } catch (e) {
    print('Failed to submit data: $e');
    // Handle error, maybe show a snackbar or toast
  }
}
}
