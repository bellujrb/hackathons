import 'package:app/core/ui/extensions/build_context_utils.dart';
import 'package:app/core/ui/styles/text_style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../styles/colors.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Column(
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
              "Configurar Layout",
              style: GoogleFonts.poppins(
                  textStyle: context.appTextStyles.textTitleBigBlackBold),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const _Config(),
                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.only(top: 15),
                    width: 400,
                    height: 350,
                    decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 67,
                          height: 59.59,
                          child: Image.asset('assets/upload.png'),
                        ),
                        SizedBox(
                          height: context.mediaHeight * 0.02,
                        ),
                        const FileUploadButton(),
                        Text(
                          "Clique para adicionar um arquivo",
                          style: GoogleFonts.poppins(
                              textStyle: context.appTextStyles.textBoldBlackBig),
                        ),
                        SizedBox(
                          height: context.mediaHeight * 0.02,
                        ),
                        Text(
                          "Suportando formatos: csv",
                          style: GoogleFonts.poppins(
                              textStyle: context.appTextStyles.textSubtitleGray),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Config extends StatelessWidget {
  const _Config();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.mediaHeight * 0.05,
        ),
        Text("Assistente para conversão de texto em colunas", style: GoogleFonts.poppins(
          textStyle: context.appTextStyles.textBoldBlackBig
        ),),
        SizedBox(
          height: context.mediaHeight * 0.04,
        ),
        Text("Delimitadores", style: GoogleFonts.poppins(
          textStyle: context.appTextStyles.textBoldBlackBig
        ),),
        SizedBox(
          height: context.mediaHeight * 0.02,
        ),
        const _CheckItem(title: 'Espaço'),
        SizedBox(
          height: context.mediaHeight * 0.02,
        ),
        const _CheckItem(title: 'Tabulação'),
        SizedBox(
          height: context.mediaHeight * 0.02,
        ),
        const _CheckItem(title: 'Vírgula'),
        SizedBox(
          height: context.mediaHeight * 0.02,
        ),
        const _CheckItem(title: 'Outros'),
      ],
    );
  }
}

class _CheckItem extends StatelessWidget {
  final String title;
  const _CheckItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 367,
      height: 41,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primary, width: 1)),
      child: Row(
        children: [
          const CheckboxExample(),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                  textStyle: context.appTextStyles.textSubtitleGray),
            ),
          )
        ],
      ),
    );
  }
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return AppColors.primary;
      }
      return AppColors.onSecondary;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

bool isChecked = false;

@override
Widget build(BuildContext context) {
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  return Checkbox(
    checkColor: Colors.white,
    fillColor: MaterialStateProperty.resolveWith(getColor),
    value: isChecked,
    onChanged: (bool? value) {},
  );
}

class FileUploadButton extends StatelessWidget {
  const FileUploadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();

        if (result != null) {
          Modular.to.navigate('layoutformatter');
        }
      },
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.cloud_upload),
          SizedBox(width: 8.0),
          Text('Selecionar Arquivo'),
        ],
      ),
    );
  }
}