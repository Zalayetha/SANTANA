import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sistem_analisis_teks_bencana/analisis/analisis_response.dart';
import 'package:sistem_analisis_teks_bencana/repo/repository.dart';

class AnalisisMenuController extends GetxController {
  final repo = Repository();
  final Rx<AnalisisResponse?> result = Rx<AnalisisResponse?>(null);
  final RxBool isLoading = false.obs;
  final RxList<String> labelList = <String>[].obs;
  final RxString selectedAlgorithm = "".obs;

  @override
  void onInit() {
    super.onInit();
    selectedAlgorithm.value = "Statistik";
  }

  analisisStatistik(String teks) async {
    try {
      isLoading.value = true;
      AnalisisResponse? data = await repo.getClassifyStatistic(teks);
      if (data != null) {
        result.value = data;
        if (data.zresult?.isNotEmpty ?? false) {
          if (kDebugMode) {
            print(result.value?.zresult?.first.label);
          }
          if (kDebugMode) {
            debugPrint(result.value!.zresult?[0].teks ?? "");
          }
          getLabel(result.value);
        }
      } else {
        if (kDebugMode) {
          debugPrint("Analisis Statistik failed : Response is Null");
        }
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint("Analisis Statistik failed : ${e.toString()}");
      }
    } finally {
      isLoading.value = false;
    }
  }

  analisisRule(String teks) async {
    try {
      isLoading.value = true;
      AnalisisResponse? data = await repo.getClassifyRule(teks);
      if (data != null) {
        result.value = data;

        if (data.zresult?.isNotEmpty ?? false) {
          if (kDebugMode) {
            print(result.value?.zresult?.first.label);
          }
          if (kDebugMode) {
            debugPrint(result.value!.zresult?[0].teks ?? "");
          }
          getLabel(result.value);
        }
      } else {
        if (kDebugMode) {
          debugPrint("Analisis Rule failed : Response is Null");
        }
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint("Analisis Rule failed : ${e.toString()}");
      }
    } finally {
      isLoading.value = false;
    }
  }

  getLabel(label) {
    List<String> tempLabel = [];
    for (var data in label.zresult ?? []) {
      tempLabel.add(data.label);
    }
    if (kDebugMode) {
      debugPrint(tempLabel.toString());
    }
    labelList.value = tempLabel.toSet().toList();
  }
}
