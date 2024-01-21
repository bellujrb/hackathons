import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_arteris/core/extesions/build_context_utils.dart';
import 'package:hackathon_arteris/core/styles/colors.dart';
import 'package:hackathon_arteris/core/styles/text_style.dart';
import 'package:hackathon_arteris/module/home/presenter/widgets/sign_modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showModal = false;

  void openModal() {
    showDialog(
      context: context,
      builder: (context) {
        return const SignModal(
          identificacaoPlaca: "-",
          localizacao: "-",
          georreferenciamento: "-",
          classificacaoSinal: "-",
          dataFabricacao: "-",
          tipoPeliculas: "-",
          corConstituinte: "-",
          dataMedicao: "-",
          equipamento: "-",
          fabricante: "-",
          modelo: "-",
          numeroSerie: "-",
          certificadoCalibracao: "-",
          valoresMedicao: "-",
          mediaMedicoes: "-",
          fotografiaPlaca: "-",
          observacoes: "-",
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final styleModifier = context.appTextStyles;

    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        leadingWidth: context.mediaWidth * 1.0,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 35,
              width: 41,
              child: Image.asset('assets/logo.png'),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Modular.to.navigate("/");
                  },
                  child: Text(
                    "Dashboard",
                    style: GoogleFonts.poppins(
                      textStyle: styleModifier.whiteSmall,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Modular.to.navigate("maps");
                  },
                  child: Text(
                    "Mapa",
                    style: GoogleFonts.poppins(
                      textStyle: styleModifier.whiteSmall,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.notification_important_rounded,
                  color: AppColors.secondary,
                ),
                const SizedBox(
                  width: 20,
                ),
                const CircleAvatar(
                  child: Text("B"),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (showModal == true)
              const SignModal(
                identificacaoPlaca: "-",
                localizacao: "-",
                georreferenciamento: "-",
                classificacaoSinal: "-",
                dataFabricacao: "-",
                tipoPeliculas: "-",
                corConstituinte: "-",
                dataMedicao: "-",
                equipamento: "-",
                fabricante: "-",
                modelo: "-",
                numeroSerie: "-",
                certificadoCalibracao: "-",
                valoresMedicao: "-",
                mediaMedicoes: "-",
                fotografiaPlaca: "-",
                observacoes: "-",
              )
           else 
              LayoutBuilder(
                builder: (context, constraints) {
                  if (context.mediaWidth > 600) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 353,
                          width: context.mediaWidth * 0.4,
                          child: Image.asset("assets/mock-stats.jpg"),
                        ),
                        SizedBox(
                          height: 353,
                          width: context.mediaWidth * 0.4,
                          child: Image.asset("assets/mock-cam.jpg"),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 353,
                            width: context.mediaWidth * 0.8,
                            child: Image.asset("assets/mock-stats.jpg"),
                          ),
                          SizedBox(
                            height: 353,
                            width: context.mediaWidth * 0.8,
                            child: Image.asset("assets/mock-cam.jpg"),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              DataTable(
                columns: <DataColumn>[
                  DataColumn(
                    label: Expanded(
                      child: Text('Numero', style: GoogleFonts.poppins()),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text('Latitude', style: GoogleFonts.poppins()),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text('Longitude', style: GoogleFonts.poppins()),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text('Codigo ou Tipo', style: GoogleFonts.poppins()),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text('Data Medição', style: GoogleFonts.poppins()),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text('Prec. Aproximada', style: GoogleFonts.poppins()),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text('Status de leitura', style: GoogleFonts.poppins()),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text('Fotos', style: GoogleFonts.poppins()),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text('Relatorio Completo', style: GoogleFonts.poppins()),
                    ),
                  ),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text('SV 116 PR 163+550 N1')),
                      const DataCell(Text('-23.89254')),
                      const DataCell(Text('-46.46916')),
                      const DataCell(Text('Mp2 Marcador de Perigo Tipo 2')),
                      const DataCell(Text('14/10/2023')),
                      const DataCell(Text('8 metros')),
                      const DataCell(Text('Sucesso')),
                      DataCell(
                        SizedBox(
                          height: 75,
                          width: 90,
                          child: Image.asset('assets/sign-1.jpg'),
                        ),
                      ),
                      DataCell(
                        InkWell(
                          onTap: () {
                            setState(() {
                              showModal = true;
                            });
                          },
                          child: Container(
                            color: Colors.green,
                            child: const Text('Ver mais'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Adicione mais linhas de dados, se necessário
                ],
              ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 300,
              width: context.mediaWidth * 0.95,
              child: Image.asset('assets/mock-alert.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
