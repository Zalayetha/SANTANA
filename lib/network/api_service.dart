import 'dart:io';

import 'package:http/http.dart' as http;

class ApiService {
  // function to predict with statistic based
  statisticClassify(String teks) async {
    final param = {'text': teks};
    var requestUrl = "";
    String queryString = Uri(queryParameters: param).query;
    if (Platform.isAndroid) {
      requestUrl = "http://10.0.2.2:5000/statistic?$queryString";
    } else if (Platform.isIOS) {
      requestUrl = "http://127.0.0.1:5000/statistic?$queryString";
    } else {
      requestUrl = "http://127.0.0.1:5000/statistic?$queryString";
    }
    var response = await http.get(Uri.parse(requestUrl));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  // function to predict with statistic based
  ruleClassify(String teks) async {
    final param = {'text': teks};
    var requestUrl = "";
    String queryString = Uri(queryParameters: param).query;
    if (Platform.isAndroid) {
      requestUrl = "http://10.0.2.2:5000/rule?$queryString";
    } else if (Platform.isIOS) {
      requestUrl = "http://127.0.0.1:5000/rule?$queryString";
    } else {
      requestUrl = "http://127.0.0.1:5000/rule?$queryString";
    }
    var response = await http.get(Uri.parse(requestUrl));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
