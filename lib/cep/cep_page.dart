import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viacep/cep/cep_bloc.dart';
import 'package:viacep/cep/cep_event.dart';
import 'package:viacep/cep/cep_state.dart';

class CepPage extends StatefulWidget {
  const CepPage({Key? key}) : super(key: key);

  @override
  State<CepPage> createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  TextEditingController cepController = TextEditingController();
  CepBloc cepBloc = CepBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta CEP'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: cepController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite o CEP',
              ),
            ),
            const SizedBox(height: 16.0),
            BlocBuilder<CepBloc, CepState>(
              bloc: cepBloc,
              builder: (context, state) {
                switch (state.runtimeType) {
                  case CepLoadingState:
                    return const Expanded(child: Center(child: CircularProgressIndicator()));

                  case CepSuccessState:
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CEP: ${state.cepModel.listData[0].cep}'),
                        Text('LOGRADOURO: ${state.cepModel.listData[0].logradouro}'),
                        Text('COMPLEMENTO: ${state.cepModel.listData[0].complemento}'),
                        Text('BAIRRO: ${state.cepModel.listData[0].bairro}'),
                        Text('LOCALIDADE: ${state.cepModel.listData[0].localidade}'),
                        Text('UF: ${state.cepModel.listData[0].uf}'),
                        Text('IBGE: ${state.cepModel.listData[0].ibge}'),
                        Text('GIA: ${state.cepModel.listData[0].gia}'),
                        Text('DDD: ${state.cepModel.listData[0].ddd}'),
                        Text('SIAFI: ${state.cepModel.listData[0].siafi}'),
                      ],
                    );

                  case CepErrorState:
                    return Text((state as CepErrorState).message, style: const TextStyle(color: Colors.red));

                  default:
                    return Container();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => cepBloc.add(CepLoadEvent(cepController.text)),
        tooltip: 'Consultar',
        child: const Icon(Icons.search),
      ),
    );
  }

  @override
  void dispose() {
    cepController.dispose();

    super.dispose();
  }
}
