import 'package:viacep/cep/cep_model.dart';

abstract class CepState {
  CepModel cepModel;

  CepState({
    required this.cepModel,
  });
}

class CepInitialState extends CepState {
  CepInitialState() : super(cepModel: CepModel(listData: []));
}

class CepLoadingState extends CepInitialState {}

class CepSuccessState extends CepState {
  CepSuccessState({required CepModel cepModel}) : super(cepModel: cepModel);
}

class CepErrorState extends CepState {
  final String message;

  CepErrorState(this.message) : super(cepModel: CepModel(listData: []));
}
