abstract class CepEvent {}

class CepLoadEvent extends CepEvent {
  String cep;

  CepLoadEvent(
    this.cep,
  );
}
