import 'package:viacep/cep/cep_model.dart';
import 'package:viacep/function.dart';

Future<CepModel> getCep(String cep) async {
  return _parse(
    await getMap(
      'https://viacep.com.br/ws/$cep/json/',
      parameters: {},
    ),
  );
}

CepModel _parse(Map<String, dynamic> map) {
  return CepModel.fromMap(map);
}
