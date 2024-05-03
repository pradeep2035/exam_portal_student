import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages

class SharedPreferencesHelper {
  static final SharedPreferencesHelper _instance =
      SharedPreferencesHelper._ctor();

  factory SharedPreferencesHelper() {
    return _instance;
  }

  SharedPreferencesHelper._ctor();

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static late SharedPreferences _prefs;
  
    static void setUserName({required String userName}) {
    _prefs.setString("username", userName);
  }

  
  static String getUserName() {
    return _prefs.getString("username") ?? "";
  }

 
    static void setIsLoggedIn({required bool isLoggedIn}) {
    _prefs.setBool("isLoggedIn",isLoggedIn );
  }

  
  static bool getIsLoggedIn() {
    return _prefs.getBool("isLoggedIn") ?? false;
  }

  static void setUserMobile({required String userMobile}) {
    _prefs.setString("userMobile", userMobile);
  }

  static String getUserMobile() {
    return _prefs.getString("userMobile") ?? "";
  }

  static void setUserId({required String userId}) {
    _prefs.setString("userId", userId);
  }

  static String getUserId() {
    return _prefs.getString("userId") ?? "";
  }
  
  static void setUserType({required String userType}) {
    _prefs.setString("userType", userType);
  }

  static String getUserType() {
    return _prefs.getString("userType") ?? "";
  }
  static void setUserBoard({required String userBoard}) {
    _prefs.setString("userBoard", userBoard);
  }

  static String getUserBoard() {
    return _prefs.getString("userBoard") ?? "";
  }
  
  static void setUserClass({required String userClass}) {
    _prefs.setString("userClass", userClass);
  }

  static String getUserClass() {
    return _prefs.getString("userClass") ?? "";
  }

  static void setUserQuizNumber({required String userQuizNumber}) {
    _prefs.setString("userQuizNumber", userQuizNumber);
  }

  static String getUserQuizNumber() {
    return _prefs.getString("userQuizNumber") ?? "";
  }

  static void setUserCompetitionName({required String userCompetitionName}) {
    _prefs.setString("userCompetitionName", userCompetitionName);
  }




//===================================================STUDENT DETAILS
  static String getStudentName() {
    return _prefs.getString("studentName") ?? "";
  }

  static void setStudentNamePref({required String studentName}) {
    _prefs.setString("studentName", studentName);
  }

  static String getschoolId() {
    return _prefs.getString("schoolId") ?? "";
  }
 

 static void setschoolId({required String schoolId}) {
    _prefs.setString("schoolId", schoolId);
  }

  static String getstudentClass() {
    return _prefs.getString("studentClass") ?? "" ;
  }


  static void setstudentClass({required String studentClass}) {
    _prefs.setString("studentClass", studentClass);
  }

  static String getstudentFatherName() {
    return _prefs.getString("studentFatherName") ?? "";
  }


 static void setstudentFatherName({required String studentFatherName}) {
    _prefs.setString("studentFatherName", studentFatherName);
  }



  static void setdateOfBirth({required String dateOfBirth}) {
    _prefs.setString("dateOfBirth", dateOfBirth);
  }

  static String getdateOfBirth() {
    return _prefs.getString("dateOfBirth") ?? "";
  }

   static void setstudentContactNumber({required String studentContactNumber}) {
    _prefs.setString("studentContactNumber", studentContactNumber);
  }

  static String getstudentContactNumber() {
    return _prefs.getString("studentContactNumber") ?? "" ;
  }


 static void setStudentId({required String studentId}) {
    _prefs.setString("StudentId", studentId);
  }

  static String getStudentId() {
    return _prefs.getString("StudentId") ?? "";
  }
 static void setstudentPassword({required String studentPassword}) {
    _prefs.setString("studentPassword", studentPassword);
  }

  static String getstudentPassword() {
    return _prefs.getString("studentPassword") ?? "";
  }
  


  static void cleanUser(){
    _prefs.clear();
  }
}