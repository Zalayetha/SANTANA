import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistem_analisis_teks_bencana/analisis/analisis_menu_controller.dart';
import 'package:sistem_analisis_teks_bencana/utils.dart';
import 'package:sistem_analisis_teks_bencana/widget/colors.dart';
import 'package:sistem_analisis_teks_bencana/widget/custom_dropdown_algorithm.dart';

class AnalisisMenu extends StatelessWidget {
  AnalisisMenu({super.key});
  final AnalisisMenuController _analisisMenuController =
      Get.put(AnalisisMenuController());
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String combinedText = _analisisMenuController.result.value?.zresult
            ?.map((e) => e.teks ?? "")
            .join(" ") ??
        "-";
    TextEditingController hasil = TextEditingController(text: combinedText);
    return Obx(() => Scaffold(
            body: SafeArea(
                child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: SingleChildScrollView(
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
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: CustomDropdownAlgorithm(),
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
                        child: ElevatedButton(
                            onPressed: () async => await _analisisMenuController
                                .analisisStatistik(_textEditingController.text),
                            child: const Text("Analisis")),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Card(
                    elevation: 1,
                    shape: const OutlineInputBorder(),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                            child: RichText(
                                text: TextSpan(
                                    children:
                                        _analisisMenuController.result.value ==
                                                null
                                            ? [const TextSpan(text: "-")]
                                            : _analisisMenuController
                                                .result.value?.zresult
                                                ?.map((e) => TextSpan(
                                                    text: "${e.teks} ",
                                                    style: TextStyle(
                                                        color: switchColor(
                                                            e.label ?? "-"))))
                                                .toList())))),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Card(
                    elevation: 1,
                    shape: const OutlineInputBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: _analisisMenuController.result.value == null
                            ? [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor:
                                              appColorMap[AppColors.bBencana],
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
                            : _analisisMenuController.labelList
                                .map((e) => Column(
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: switchColor(e),
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
              ],
            ),
          ),
        ))));
  }
}
