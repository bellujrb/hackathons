import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/text_style.dart';

class MineTimeWidget extends StatefulWidget {
  const MineTimeWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MineTimeWidgetState createState() => _MineTimeWidgetState();
}

class _MineTimeWidgetState extends State<MineTimeWidget> {
  Duration duration = const Duration(hours: 2, minutes: 10);
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds - reduceSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Container(
      height: 138,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: AppColors.surfacePrimary,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Time mining in this session",
            style: context.appTextStyles.smallWhite,
          ),
          Text(
            "$hours:$minutes:$seconds",
            style: const TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Total time mining: 20hours",
            style: context.appTextStyles.miniSmallGray,
          ),
        ],
      ),
    );
  }
}
