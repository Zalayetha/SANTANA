import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistem_analisis_teks_bencana/analisis/algorithm_label.dart';

class CustomDropdownAlgorithm extends StatefulWidget {
  const CustomDropdownAlgorithm({
    super.key,
    required this.onAlgorithmSelected,
  });

  final void Function(AlgorithmLabel) onAlgorithmSelected;
  @override
  State<CustomDropdownAlgorithm> createState() =>
      _CustomDropdownAlgorithmState();
}

class _CustomDropdownAlgorithmState extends State<CustomDropdownAlgorithm> {
  final TextEditingController algoirthmController = TextEditingController();
  AlgorithmLabel? selectedAlgorithm;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<AlgorithmLabel>(
      width: Get.width,
      expandedInsets: const EdgeInsets.symmetric(horizontal: 24.0),
      initialSelection: AlgorithmLabel.statistik,
      controller: algoirthmController,
      label: const Text("Algoritma"),
      onSelected: (AlgorithmLabel? label) {
        setState(() {
          selectedAlgorithm = label;
          if (label != null) {
            widget.onAlgorithmSelected(label);
          }
        });
      },
      dropdownMenuEntries: AlgorithmLabel.values
          .map<DropdownMenuEntry<AlgorithmLabel>>((AlgorithmLabel algorithm) {
        return DropdownMenuEntry<AlgorithmLabel>(
          value: algorithm,
          label: algorithm.label,
        );
      }).toList(),
    );
  }
}
