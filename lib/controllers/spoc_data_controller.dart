import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../api_value.dart';

class SpocDataController extends GetxController{
Dio dio = Dio();

  fetchspocDetails(String spocId) async {
    try {
      Map<String,dynamic> data = {'spoc_id':spocId};
      final response = await dio.get(apiValue.spocdetailsUrl,queryParameters:data );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        // final List<Map<String, dynamic>> typedData = data.cast<Map<String, dynamic>>();
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }


Future<List<Map<String, dynamic>>> fetchRegisteredStudents(String schoolId) async {
  
    try {
      Map<String,dynamic> data = {'school_id':schoolId};
      final response = await dio.get(apiValue.registeredStudentDetailsUrl,queryParameters: data);
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


}