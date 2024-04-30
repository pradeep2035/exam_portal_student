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

  static String getUserCompetitionName() {
    return _prefs.getString("userCompetitionName") ?? "";
  }

  static void setUserBoardPref({required String userBoardPref}) {
    _prefs.setString("userBoardPref", userBoardPref);
  }

  static String getUserBoardPref() {
    return _prefs.getString("userBoardPref") ?? "Coding";
  }
 

 static void setUserBoardIndexPref({required int userBoardIndexPref}) {
    _prefs.setInt("userBoardIndexPref", userBoardIndexPref);
  }

  static int getUserBoardIndexPref() {
    return _prefs.getInt("userBoardIndexPref") ?? 0 ;
  }


  static void setUserLanguagePref({required String userLanguagePref}) {
    _prefs.setString("userLanguagePref", userLanguagePref);
  }

  static String getUserLanguagePref() {
    return _prefs.getString("userLanguagePref") ?? "English";
  }


 static void setUserLanguageIndexPref({required int userLanguageIndexPref}) {
    _prefs.setInt("userLanguageIndexPref", userLanguageIndexPref);
  }

  static int getUserLanguageIndexPref() {
    return _prefs.getInt("userLanguageIndexPref") ?? 0 ;
  }


  static void setUserClassPref({required String userClassPref}) {
    _prefs.setString("userClassPref", userClassPref);
  }

  static String getUserClassPref() {
    return _prefs.getString("userClassPref") ?? "All Classes";
  }

   static void setUserClassIndexPref({required int userClassIndexPref}) {
    _prefs.setInt("userClassIndexPref", userClassIndexPref);
  }

  static int getUserClassIndexPref() {
    return _prefs.getInt("userClassIndexPref") ?? 0 ;
  }


 static void setUserPref({required String userPref}) {
    _prefs.setString("userPref", userPref);
  }

  static String getUserPref() {
    return _prefs.getString("userPref") ?? "";
  }
  


  static void cleanUser(){
    _prefs.clear();
  }
}