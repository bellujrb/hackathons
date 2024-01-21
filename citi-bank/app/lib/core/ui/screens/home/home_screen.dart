import 'package:app/core/ui/extensions/build_context_utils.dart';
import 'package:app/core/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../styles/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              child: SizedBox(
                width: 300,
                height: 300,
                child: Image.asset('assets/logo.png'),
              ),
            ),
          ),
          SizedBox(
            height: context.mediaHeight * 0.05,
          ),
          Center(
            child: Text(
              "Painel Admin",
              style: GoogleFonts.poppins(
                  textStyle: context.appTextStyles.textTitleBigBlackBold),
            ),
          ),
          SizedBox(
            height: context.mediaHeight * 0.05,
          ),
          const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _InfoWithButton(
                  icon: Icons.read_more,
                  title: "Registrados",
                  number: 3233,
                ),
                _InfoWithButton(
                  icon: Icons.confirmation_num,
                  title: "Sucesso",
                  number: 323,
                ),
                _InfoWithButton(
                  icon: Icons.error,
                  title: "Erros",
                  number: 8,
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.mediaHeight * 0.07,
          ),
          const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ButtonFunctions(
                    title: "Layout",
                    subtitle: "Ajuste o Layout do documento CNAB da sua empresa",
                    buttonTitle: "Configurar Layout",
                    route: '/layout',
                    img: 'assets/img1.png'),
                _ButtonFunctions(
                    title: "Remessa",
                    subtitle: "Faça o upload da sua remessa instântaneamente ",
                    buttonTitle: "Adicionar Remessa",
                    route: '/sendarquive',
                    img: 'assets/box.png'),
                _ButtonFunctions(
                    title: "Historico",
                    subtitle: "Consulte todos os seus arquivos ",
                    buttonTitle: "Historico",
                    route: '/historic',
                    img: 'assets/img3.png'),
                _ButtonFunctions(
                    title: "Dashboard",
                    subtitle: "Monitore os seus indicadores de forma simples e intuitiva",
                    buttonTitle: "Dashboard",
                    route: 'dashboard',
                    img: 'assets/img4.png')
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ButtonFunctions extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonTitle;
  final String route;

  final String img;

  const _ButtonFunctions({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.buttonTitle, required this.route, required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 278,
      width: 250,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
            offset: const Offset(22.0, -25.0),
            child: SizedBox(
              width: 84,
              height: 72,
              child: Image.asset(img),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                  textStyle: context.appTextStyles.textBoldBlackBig),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              subtitle,
              style: GoogleFonts.poppins(
                  textStyle: context.appTextStyles.textSubtitleGray),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => Modular.to.navigate(route),
              child: Text(buttonTitle),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoWithButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final int number;
  const _InfoWithButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 302,
      height: 134,
      decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform.translate(
                offset: const Offset(7.5, -25.0),
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(16)),
                  alignment: AlignmentDirectional.center,
                  child: Icon(icon),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                          textStyle: context.appTextStyles.textSubtitleGray),
                    ),
                    Text(
                      number.toString(),
                      style: GoogleFonts.poppins(
                          textStyle:
                              context.appTextStyles.textNumberDashboardBold),
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            width: context.mediaWidth * 1.0,
            height: 1,
            decoration: BoxDecoration(color: AppColors.primary),
          ),
          SizedBox(
            height: context.mediaHeight * 0.02,
          ),
          GestureDetector(
            onTap: () => Modular.to.navigate("historic"),
            child: Container(
              width: 200,
              height: 35,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16)),
              alignment: AlignmentDirectional.center,
              child: Text(
                "Saiba mais",
                style: GoogleFonts.poppins(
                    textStyle: context.appTextStyles.textSubtitleGray),
              ),
            ),
          )
        ],
      ),
    );
  }
}
