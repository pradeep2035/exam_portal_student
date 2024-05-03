  import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sat_exam_portal/api_value.dart';
import 'package:sat_exam_portal/screens/dashboards/spoc_dashboard.dart';
import 'package:sat_exam_portal/screens/dashboards/student_dashboard.dart';

class SpocController extends GetxController{
   Dio dio = Dio();

 Future<List<Map<String, dynamic>>> fetchData() async {
    try {
      final response = await dio.get(apiValue.questionListUrl);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        final List<Map<String, dynamic>> typedData = data.cast<Map<String, dynamic>>();
        return typedData;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

//======================================================search api
Future<List<Map<String, dynamic>>> searchQuestion(String query) async {
  try {
    Map<String, dynamic> data = {'query': query};
    print(query);
    final response = await dio.get(apiValue.searchQuestionUrl, queryParameters: data);
    if (response.statusCode == 200) {
      List<dynamic> questionList = response.data['data'];
      //print(questionList);
      // Convert each item to Map<String, dynamic>
      List<Map<String, dynamic>> mappedQuestionList = questionList.map((item) => item as Map<String, dynamic>).toList();
      print(mappedQuestionList);
      return mappedQuestionList;
    } else if (response.statusCode == 404) {
      print("FAILED SEARCH API");
      return [];
    }
  } catch (e) {
    print('Error searching: $e');
    throw Exception('Failed to search: $e');
  }
  return [];
}

 Future<Map<String, dynamic>?>fetchQuestionById(String id) async {
  try {
     Map<String, dynamic> data = {'id': id};
      final response = await dio.get(apiValue.detailQuestionUrl,queryParameters: data);
      if (response.statusCode == 200) {
        final  data = response.data['data'];
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
}


//================================================================question paper add post api
 createQuestionPaper(List<String> questionIds,schoolId,examName,duration,totalMarks,classData) async {
  print(questionIds);
  print(classData);
  print(schoolId);

  try {
    // Make API call to submit question IDs
    print("hello");
    final response = await dio.post(apiValue.createQuestioPaperUrl, 
    data:{
          "question_id":questionIds ,
          "school_id": schoolId,
          "test_name": examName,     
          "duration": duration,
          "total_marks":totalMarks,
          "class": classData
        }
    );
    if (response.statusCode == 200) {
      print("successfully exam scheduled");
    } else {
      throw Exception('Failed to submit data');
    }
  } catch (e) {
    print('Failed to submit data: $e');
    // Handle error, maybe show a snackbar or toast
  }
}


 spocLogin(String spocId, String spocPassword) async {
  try {
    // Make API call to submit question IDs
    print("hello");
    final response = await dio.post(apiValue.spocLoginUrl, 
    data:{
          "spoc_id":spocId,
          "spoc_password":spocPassword
        }
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = response.data;
        
        // Store the parsed data in a variable
      String spocId = responseData['spoc_id'];
      String schoolId = responseData['school_id'];
      print("successfully login");
      Get.off(()=>SpocDashboard(spocId:spocId, schoolId:schoolId));
    } else {
      throw Exception('Failed to submit data');
    }
  } catch (e) {
    print('Failed to submit data: $e');
    // Handle error, maybe show a snackbar or toast
  }
}



 studentLogin(String studentId, String studentPassword) async {

  try {
    // Make API call to submit question IDs
    print("hello");
    final response = await dio.post(apiValue.studentLoginUrl, 
    data:{
          "student_id": studentId,
          "password": studentPassword
        }
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = response.data;
      print("successfully login");
      String studentId = responseData['student_id'];
      String studentName = responseData['student_name'];
      String schoolId = responseData['school_id'];
      Get.off(()=>studentDashboard(studentId:studentId, studentName:studentName,schoolId:schoolId));
    } else {
      throw Exception('Failed to submit data');
    }
  } catch (e) {
    print('Failed to submit data: $e');
    // Handle error, maybe show a snackbar or toast
  }
}


}