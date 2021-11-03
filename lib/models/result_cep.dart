import 'dart:convert';

class ResultCep {

  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;


  ResultCep({

    this.logradouro,
    this.complemento,
    this.bairro,
    this.localidade,
    this.uf,

  });

  factory ResultCep.fromJson(String str) => ResultCep.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultCep.fromMap(Map<String, dynamic> json) => ResultCep(

    logradouro: json["logradouro"] == null ? null : json["logradouro"],
    complemento: json["complemento"] == null ? null : json["complemento"],
    bairro: json["bairro"] == null ? null : json["bairro"],
    localidade: json["localidade"] == null ? null : json["localidade"],
    uf: json["uf"] == null ? null : json["uf"],

  );

  Map<String, dynamic> toMap() => {

    "logradouro": logradouro == null ? null : logradouro,
    "complemento": complemento == null ? null : complemento,
    "bairro": bairro == null ? null : bairro,
    "localidade": localidade == null ? null : localidade,
    "uf": uf == null ? null : uf,

  };
}
