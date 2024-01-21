import 'package:app/core/ui/extensions/build_context_utils.dart';
import 'package:app/core/ui/styles/text_style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../styles/colors.dart';

class SendArquiveScreen extends StatelessWidget {
  const SendArquiveScreen({super.key});

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
              "Enviar Arquivo",
              style: GoogleFonts.poppins(
                  textStyle: context.appTextStyles.textTitleBigBlackBold),
            ),
          ),
          Container(
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
        ],
      ),
    );
  }
}

class FileUploadButton extends StatelessWidget {
  const FileUploadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();

        if (result != null) {
          Modular.to.navigate('process');
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