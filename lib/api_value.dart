class ApiValue {
  static List url = [
    "production url",
    "https://exam-portal-p3fq.onrender.com/"
  ];
  static int isBeta = 1;
  //========================================================Authentication
  String spocLoginUrl = '${url[isBeta]}spoc_login';
  String studentLoginUrl = '${url[isBeta]}login/student';
  String studentRegistrationUrl = '${url[isBeta]}post/student_info';

  //========================================================spocdetails
  String spocdetailsUrl = '${url[isBeta]}spoc_details';
  //========================================================spocdetails
  String registeredStudentDetailsUrl = '${url[isBeta]}fetch_student_info';

  //========================================================Question Bank
  String questionUploadUrl = '${url[isBeta]}post/question_bank';
  String questionListUrl = '${url[isBeta]}get/question_bank';
  String searchQuestionUrl = '${url[isBeta]}search/question_bank';
  //========================================================Exam 
  String examListUrl = '${url[isBeta]}exam_details?school_id=';
  //========================================================Exam 
  String questionPaperUrl = '${url[isBeta]}fetch_questions_by_id?_id=';
  String detailQuestionUrl = '${url[isBeta]}question_popup';
  String createQuestioPaperUrl = '${url[isBeta]}question-papers';
  //========================================================Category List
}

ApiValue apiValue = ApiValue();
