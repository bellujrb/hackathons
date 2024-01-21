import 'package:flutter/material.dart';

class SignModal extends StatelessWidget {
  final String identificacaoPlaca;
  final String localizacao;
  final String georreferenciamento;
  final String classificacaoSinal;
  final String dataFabricacao;
  final String tipoPeliculas;
  final String corConstituinte;
  final String dataMedicao;
  final String equipamento;
  final String fabricante;
  final String modelo;
  final String numeroSerie;
  final String certificadoCalibracao;
  final String valoresMedicao;
  final String mediaMedicoes;
  final String fotografiaPlaca;
  final String observacoes;

  const SignModal({
    super.key,
    required this.identificacaoPlaca,
    required this.localizacao,
    required this.georreferenciamento,
    required this.classificacaoSinal,
    required this.dataFabricacao,
    required this.tipoPeliculas,
    required this.corConstituinte,
    required this.dataMedicao,
    required this.equipamento,
    required this.fabricante,
    required this.modelo,
    required this.numeroSerie,
    required this.certificadoCalibracao,
    required this.valoresMedicao,
    required this.mediaMedicoes,
    required this.fotografiaPlaca,
    required this.observacoes,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Detalhes da Placa'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Identificação da Placa: $identificacaoPlaca'),
            Text('Localização: $localizacao'),
            Text('Georreferenciamento: $georreferenciamento'),
            Text('Classificação do Sinal: $classificacaoSinal'),
            Text('Data de Fabricação: $dataFabricacao'),
            Text('Tipo de Películas: $tipoPeliculas'),
            Text('Cores Constituintes: $corConstituinte'),
            Text('Data da Medição: $dataMedicao'),
            Text('Equipamento Utilizado: $equipamento'),
            Text('Fabricante: $fabricante'),
            Text('Modelo: $modelo'),
            Text('Número de Série: $numeroSerie'),
            Text('Certificado de Calibração: $certificadoCalibracao'),
            Text('Valores de Medição: $valoresMedicao'),
            Text('Média das Medidas: $mediaMedicoes'),
            Text('Fotografia da Placa: $fotografiaPlaca'),
            Text('Observações: $observacoes'),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text('Fechar'),
        ),
      ],
    );
  }
}
