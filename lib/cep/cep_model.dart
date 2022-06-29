import 'dart:convert';

import 'package:viacep/function.dart';

class CepModel {
  final List<Data> listData;

  CepModel({
    required this.listData,
  });

  factory CepModel.fromMap(Map<String, dynamic> map) {
    List<Data> data = [];

    // if (map['data'] != null) {
    //   map['data'].forEach((v) {
    //     data.add(Data.fromMap(v));
    //   });
    // }

    data.add(Data.fromMap(map));

    return CepModel(
      listData: data,
    );
  }

  factory CepModel.fromJson(String json) {
    return CepModel.fromMap(jsonDecode(json));
  }
}

class Data {
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;
  String ibge;
  String gia;
  String ddd;
  String siafi;

  Data({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      cep: getStringFromMap(map, 'cep'),
      logradouro: getStringFromMap(map, 'logradouro'),
      complemento: getStringFromMap(map, 'complemento'),
      bairro: getStringFromMap(map, 'bairro'),
      localidade: getStringFromMap(map, 'localidade'),
      uf: getStringFromMap(map, 'uf'),
      ibge: getStringFromMap(map, 'ibge'),
      gia: getStringFromMap(map, 'gia'),
      ddd: getStringFromMap(map, 'ddd'),
      siafi: getStringFromMap(map, 'siafi'),
    );
  }

  factory Data.fromJson(String json) {
    return Data.fromMap(jsonDecode(json));
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'cep': cep,
        'logradouro': logradouro,
        'complemento': complemento,
        'bairro': bairro,
        'localidade': localidade,
        'uf': uf,
        'ibge': ibge,
        'gia': gia,
        'ddd': ddd,
        'siafi': siafi,
      };

  String toJson() => jsonEncode(toMap());
}
