import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_austria/core/extensions/build_context_utils.dart';
import 'package:hackathon_austria/core/styles/colors.dart';
import 'package:hackathon_austria/module/home/presenter/widgets/appbar_widget.dart';
import 'package:hackathon_austria/module/home/presenter/widgets/bottom_navigator.dart';
import 'package:hackathon_austria/module/home/presenter/widgets/item_forum.dart';
import 'package:hackathon_austria/module/home/presenter/widgets/selector_mock.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        appBar: buildAppBar(context),
        bottomNavigationBar: const BottomNavigationWidget(),
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 36,
                    width: context.mediaWidth * 0.9,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryGray,
                      borderRadius: BorderRadius.circular(8)
                      ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: Text(
                            "Search",
                            style: GoogleFonts.inter(),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            right: 5
                          ),
                          child: Icon(
                            Icons.mic,
                            size: 24,
                            color: AppColors.primary,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SelectorMock(),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Conversations",
                    style: GoogleFonts.inter(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ItemForum(
                    title: "Digital signal processing on signal processors",
                    subtitle:
                        "Hey guys, have you ever used a DSP chip or software for audio processing",
                    mockIMG: "assets/mocklike1.png",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ItemForum(
                    title: "Method of digital signal processing",
                    subtitle:
                        "What's your go-to method or technique for cleaning up noisy audio or enhancing images digitally?",
                    mockIMG: "assets/mocklike2.png",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ItemForum(
                    title: "Micromanufacturing technologies",
                    subtitle:
                        "Come across any interesting micromanufacturing techniques lately?",
                    mockIMG: "assets/mocklike3.png",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ItemForum(
                    title: "Digital filter optimization and assembler",
                    subtitle:
                        "You didn't register for this course yet.",
                    mockIMG: "assets/mocklike3.png",
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
