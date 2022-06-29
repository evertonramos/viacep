import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:viacep/cep/cep_event.dart';
import 'package:viacep/cep/cep_service.dart';
import 'package:viacep/cep/cep_state.dart';

class CepBloc extends Bloc<CepEvent, CepState> {
  CepBloc() : super(CepInitialState()) {
    on<CepLoadEvent>((event, emit) async {
      emit(CepLoadingState());

      try {
        emit(CepSuccessState(cepModel: await getCep(event.cep)));
      } catch (e) {
        emit(CepErrorState((e as DioError).message));
      }
    });
  }
}
