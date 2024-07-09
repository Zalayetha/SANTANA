import 'package:flutter/material.dart';
import 'package:sistem_analisis_teks_bencana/analisis/analisis_response.dart';
import 'package:sistem_analisis_teks_bencana/network/api_service.dart';

class Repository {
  // repo for classify with statistical based
  getClassifyStatistic(String teks) async {
    final response = await ApiService().statisticClassify(teks);
    if (response.isNotEmpty) {
      try {
        return analisisResponseFromJson(response);
      } catch (e) {
        debugPrint("Error decoding JSON: $e");
        return null;
      }
    } else {
      debugPrint("Empty response from API");
      return null; // Return null if response is empty
    }
  }

  // repo for classify with rule based
  getClassifyRule(String teks) async {
    final response = await ApiService().ruleClassify(teks);
    if (response.isNotEmpty) {
      try {
        return analisisResponseFromJson(response);
      } catch (e) {
        debugPrint("Error decoding JSON: $e");
        return null;
      }
    } else {
      debugPrint("Empty response from API");
      return null; // Return null if response is empty
    }
  }
}
