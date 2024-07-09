// To parse this JSON data, do
//
//     final analisisResponse = analisisResponseFromJson(jsonString);

import 'dart:convert';

AnalisisResponse analisisResponseFromJson(String str) =>
    AnalisisResponse.fromJson(json.decode(str));

String analisisResponseToJson(AnalisisResponse data) =>
    json.encode(data.toJson());

class AnalisisResponse {
  List<Zresult>? zresult;

  AnalisisResponse({
    this.zresult,
  });

  factory AnalisisResponse.fromJson(Map<String, dynamic> json) =>
      AnalisisResponse(
        zresult: json["zresult"] == null
            ? []
            : List<Zresult>.from(
                json["zresult"]!.map((x) => Zresult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "zresult": zresult == null
            ? []
            : List<dynamic>.from(zresult!.map((x) => x.toJson())),
      };
}

class Zresult {
  String? teks;
  String? label;

  Zresult({
    this.teks,
    this.label,
  });

  factory Zresult.fromJson(Map<String, dynamic> json) => Zresult(
        teks: json["teks"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "teks": teks,
        "label": label,
      };
}
