// To parse this JSON data, do
//
//     final analisisResponse = analisisResponseFromJson(jsonString);

import 'dart:convert';

AnalisisResponse analisisResponseFromJson(String str) =>
    AnalisisResponse.fromJson(json.decode(str));

String analisisResponseToJson(AnalisisResponse data) =>
    json.encode(data.toJson());

class AnalisisResponse {
  List<List<Zresult>>? zresult;

  AnalisisResponse({
    this.zresult,
  });

  factory AnalisisResponse.fromJson(Map<String, dynamic> json) =>
      AnalisisResponse(
        zresult: json["zresult"] == null
            ? []
            : List<List<Zresult>>.from(json["zresult"]!.map(
                (x) => List<Zresult>.from(x.map((x) => Zresult.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "zresult": zresult == null
            ? []
            : List<dynamic>.from(zresult!
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class Zresult {
  String? label;
  String? probabilitas;
  String? teks;

  Zresult({
    this.label,
    this.probabilitas,
    this.teks,
  });

  factory Zresult.fromJson(Map<String, dynamic> json) => Zresult(
        label: json["label"],
        probabilitas: json["probabilitas"],
        teks: json["teks"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "probabilitas": probabilitas,
        "teks": teks,
      };
}
