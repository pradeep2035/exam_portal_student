  import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sat_exam_portal/api_value.dart';

class QuestionPaperController extends GetxController{
   Dio dio = Dio();

 Future<List<Map<String, dynamic>>> fetchQuestionPaper(String exam_id) async {
  
    try {
      final response = await dio.get(apiValue.questionPaperUrl+exam_id);
      print(apiValue.questionPaperUrl+exam_id);
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
Future searchQuestion(String query)async{
    Map<String,dynamic> data = {'query':query};
    final response = await dio.get(apiValue.searchQuestionUrl,queryParameters: data);
    if(response.statusCode==200){
      List questionlist = response.data['data'];
      return questionlist;
    }
    else if(response.statusCode==404){
      print("FAILED SEARCH API ");
      return [];
    }   
  }




}