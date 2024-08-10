import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sistem_analisis_teks_bencana/analisis/algorithm_label.dart';
import 'package:sistem_analisis_teks_bencana/analisis/analisis_menu_controller.dart';
import 'package:sistem_analisis_teks_bencana/utils.dart';
import 'package:sistem_analisis_teks_bencana/widget/colors.dart';
import 'package:sistem_analisis_teks_bencana/widget/custom_dropdown_algorithm.dart';

class AnalisisMenu extends StatelessWidget {
  AnalisisMenu({super.key});
  final AnalisisMenuController _analisisMenuController =
      Get.put(AnalisisMenuController());
  final TextEditingController _textEditingController = TextEditingController();
  // function to handle algorithm value from dropdown
  void _handleAlgorithmSelected(AlgorithmLabel label) {
    _analisisMenuController.isLoading.value = true;
    _analisisMenuController.selectedAlgorithm.value = label;
    Future.delayed(const Duration(milliseconds: 1500), () {
      _analisisMenuController.result.value = null;
      _analisisMenuController.isLoading.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
            body: SafeArea(
                child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Pilih Algoritma",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: CustomDropdownAlgorithm(
                    initialSelection:
                        _analisisMenuController.selectedAlgorithm.value ??
                            AlgorithmLabel.statistik,
                    onAlgorithmSelected: _handleAlgorithmSelected,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextField(
                  decoration: const InputDecoration(
                      labelText: "Masukan teks yang ingin anda analisis"),
                  controller: _textEditingController,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 5,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (_analisisMenuController
                                    .selectedAlgorithm.value ==
                                AlgorithmLabel.statistik) {
                              await _analisisMenuController.analisisStatistik(
                                  _textEditingController.text);
                            } else if (_analisisMenuController
                                    .selectedAlgorithm.value ==
                                AlgorithmLabel.aturan) {
                              await _analisisMenuController
                                  .analisisRule(_textEditingController.text);
                            }
                          },
                          child: const Text("Analisis")),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          "Hasil Analisis",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      _analisisMenuController.isLoading.value
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 24.0),
                              child: Center(
                                child: LoadingAnimationWidget.inkDrop(
                                  color: Theme.of(context).primaryColor,
                                  size: 80,
                                ),
                              ),
                            )
                          : _analisisMenuController
                                      .result.value?.zresult?.isEmpty ??
                                  true
                              ? const SizedBox()
                              : Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24),
                                      child: Card(
                                        elevation: 1,
                                        shape: const OutlineInputBorder(),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children:
                                                _analisisMenuController
                                                            .result.value ==
                                                        null
                                                    ? [
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                CircleAvatar(
                                                                  backgroundColor:
                                                                      appColorMap[
                                                                          AppColors
                                                                              .bBencana],
                                                                ),
                                                                const SizedBox(
                                                                  width: 8,
                                                                ),
                                                                const Text('-')
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 12,
                                                            )
                                                          ],
                                                        )
                                                      ]
                                                    : _analisisMenuController
                                                        .labelList
                                                        .map((e) => Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    CircleAvatar(
                                                                      backgroundColor:
                                                                          switchColor(
                                                                              e,
                                                                              _analisisMenuController.selectedAlgorithm.value ?? AlgorithmLabel.statistik),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                    Text(e)
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                  height: 12,
                                                                )
                                                              ],
                                                            ))
                                                        .toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    ListView.builder(
                                        shrinkWrap:
                                            true, // You might need to add this if you're seeing layout issues
                                        physics:
                                            const NeverScrollableScrollPhysics(), // Prevents the list from scrolling separately
                                        itemCount: _analisisMenuController
                                            .result.value?.zresult?.length,
                                        itemBuilder: (context, index) => Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 24.0),
                                                  child: Text(
                                                    "Kalimat ke - ${index + 1}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineSmall,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 24.0),
                                                  child: Card(
                                                    elevation: 1,
                                                    shape:
                                                        const OutlineInputBorder(),
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                8.0),
                                                        child: RichText(
                                                            text: TextSpan(
                                                                children: _analisisMenuController
                                                                            .result
                                                                            .value ==
                                                                        null
                                                                    ? [
                                                                        const TextSpan(
                                                                            text:
                                                                                "-")
                                                                      ]
                                                                    : _analisisMenuController
                                                                        .result
                                                                        .value
                                                                        ?.zresult?[
                                                                            index]
                                                                        .map((e) =>
                                                                            TextSpan(text: "${e.teks} ", style: TextStyle(color: switchColor(e.label ?? "-", _analisisMenuController.selectedAlgorithm.value ?? AlgorithmLabel.statistik))))
                                                                        .toList()))),
                                                  ),
                                                ),
                                              ],
                                            ))
                                  ],
                                )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ))));
  }
}
