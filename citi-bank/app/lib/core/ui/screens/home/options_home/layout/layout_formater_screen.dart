import 'package:app/core/ui/extensions/build_context_utils.dart';
import 'package:app/core/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../styles/colors.dart';

class LayoutFormatterScreen extends StatelessWidget {
  const LayoutFormatterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: context.mediaWidth * 1.0,
              height: 138,
              decoration: BoxDecoration(
                color: AppColors.primary,
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () => Modular.to.navigate('home'),
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: context.mediaHeight * 0.05,
            ),
            Center(
              child: Text(
                "Layout Formatter",
                style: GoogleFonts.poppins(
                    textStyle: context.appTextStyles.textTitleBigBlackBold),
              ),
            ),
            Center(
                child: Column(
              children: [
                SizedBox(
                  height: context.mediaHeight * 0.05,
                ),
                const ItemFormat(
                  name: "122.423.523.52",
                  dado: "CPF",
                ),
                const SizedBox(
                  height: 20,
                ),
                const ItemFormat(
                  name: "Paulo Rodrigues",
                  dado: "Nome",
                ),
                const SizedBox(
                  height: 20,
                ),
                const ItemFormat(
                  name: "Mei",
                  dado: "Tipo Registro",
                ),
                const SizedBox(
                  height: 20,
                ),
                const ItemFormat(
                  name: "Chave",
                  dado: "Clique para ver",
                ),
                const SizedBox(
                  height: 20,
                ),
                const ItemFormat(
                  name: "Cobrança",
                  dado: "43",
                ),
                const SizedBox(
                  height: 20,
                ),
                const ItemFormat(
                  name: "Ocorrencia",
                  dado: "12",
                ),
                const SizedBox(
                  height: 20,
                ),
                const ItemFormat(
                  name: "Sequencia",
                  dado: "12",
                ),
                const SizedBox(
                  height: 20,
                ),
                const ItemFormat(
                  name: "Nome",
                  dado: "Pedro Afonso",
                ),
                const SizedBox(
                  height: 20,
                ),
                const ItemFormat(
                  name: "Valor",
                  dado: "5323.00",
                ),
                SizedBox(
                  height: context.mediaHeight * 0.05,
                ),
                GestureDetector(
                  onTap: () => {Modular.to.navigate('/')},
                  child: Container(
                    margin: const EdgeInsets.only(top: 40),
                    width: context.mediaWidth * 0.4,
                    height: context.mediaHeight * 0.06,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(12)),
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      "Converter",
                      style: GoogleFonts.poppins(
                          textStyle: context.appTextStyles.titleButton),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

class ItemFormat extends StatelessWidget {
  final String name;
  final String dado;
  const ItemFormat({super.key, required this.name, required this.dado});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.mediaWidth * 0.6,
      height: 72,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name),
          ),
          const DefaultDropDown(),
        ],
      ),
    );
  }
}

class DefaultDropDown extends StatefulWidget {
  const DefaultDropDown({Key? key}) : super(key: key);

  @override
  State<DefaultDropDown> createState() => _DefaultDropDownState();
}

class _DefaultDropDownState extends State<DefaultDropDown> {
  static List<String> data = [
    'Tipo',
    'Nome',
    'CPF',
    'Endereco',
    'Idade',
    'Descricao'
  ];

  String firstValueDropDown = data.first;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: DropdownButton<String>(
          value: firstValueDropDown,
          icon: Icon(
            Icons.arrow_drop_down_outlined,
            color: AppColors.primary,
            size: 25,
          ),
          underline: Container(
            height: 2,
            color: AppColors.primary,
          ),
          items: data.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: GoogleFonts.poppins(
                    textStyle: context.appTextStyles.textSubtitleGray),
              ),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              firstValueDropDown = value!;
            });
          },
        ),
      ),
    );
  }
}