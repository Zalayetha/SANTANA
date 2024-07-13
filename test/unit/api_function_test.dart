import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sistem_analisis_teks_bencana/network/api_service.dart';
import 'api_function_test.mocks.dart' as mocks;

@GenerateMocks([http.Client])
void main() {
  group('Fetch Result Classification', () {
    test(
        'returns an result classification (Statistic) if the http call completes successfully',
        () async {
      final client = mocks.MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      final param = {'text': "Telah terjadi tanah longsor di Jawa Barat"};
      String queryString = Uri(queryParameters: param).query;
      when(client
              .get(Uri.parse('http://127.0.0.1:5000/statistic?$queryString')))
          .thenAnswer((_) async => http.Response(
              '{"zresult":[{"label":"B-Waktu","teks":"Telah"},{"label":"O","teks":"terjadi"},{"label":"B-Bencana","teks":"tanah"},{"label":"I-Bencana","teks":"longsor"},{"label":"I-Lokasi","teks":"di"},{"label":"I-Lokasi","teks":"Jawa"},{"label":"B-Waktu","teks":"Barat"}]}',
              200));

      expect(
          await ApiService()
              .statisticClassify("Telah terjadi tanah longsor di Jawa Barat"),
          isA<String>());
    });
    test(
        'returns an result classification (Rule Based) if the http call completes successfully',
        () async {
      final client = mocks.MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      final param = {'text': "Telah terjadi tanah longsor di Jawa Barat"};
      String queryString = Uri(queryParameters: param).query;
      when(client.get(Uri.parse('http://127.0.0.1:5000/rule?$queryString')))
          .thenAnswer((_) async => http.Response(
              '{"zresult":[{"label":"Other","teks":"Telah"},{"label":"Bencana","teks":"terjadi"},{"label":"Bencana","teks":"tanah"},{"label":"Bencana","teks":"longsor"},{"label":"Other","teks":"di"},{"label":"Lokasi","teks":"Jawa"},{"label":"Lokasi","teks":"Barat"}]}',
              200));

      expect(
          await ApiService()
              .ruleClassify("Telah terjadi tanah longsor di Jawa Barat"),
          isA<String>());
    });
  });
}
