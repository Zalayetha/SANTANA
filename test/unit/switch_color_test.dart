import 'package:sistem_analisis_teks_bencana/analisis/algorithm_label.dart';
import 'package:sistem_analisis_teks_bencana/utils.dart';
import 'package:sistem_analisis_teks_bencana/widget/colors.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Text color based on the algorithm type', () {
    test('Color result should be blue because B-Bencana', () {
      final color = switchColor('B-Bencana', AlgorithmLabel.statistik);

      expect(color, appColorMap[AppColors.bBencana]);
    });

    test('Color result should be blue because Bencana', () {
      final color = switchColor('Bencana', AlgorithmLabel.aturan);

      expect(color, appColorMap[AppColors.bBencana]);
    });
  });
}
