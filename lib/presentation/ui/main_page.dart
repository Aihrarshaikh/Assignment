import 'package:flutter/material.dart';
import '../../configs/app_strings.dart';
import '../../configs/asset_paths.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../states/main_page_bloc.dart';
import 'bonfire_header.dart';
import 'bonfire_avatars.dart';
import 'bonfire_question_card.dart';
import 'bonfire_options.dart';
import 'bonfire_footer.dart';
import 'navigation/buttom_navigation_bar.dart';
import 'bonfire_background_carousel.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedOption = 2; // Default selected (C)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background image with gradient overlay
          const BonfireBackgroundCarousel(),
          SafeArea(
            child: Column(
              children: [
                const BonfireHeader(),
                const SizedBox(height: 16),
                const Spacer(),
                const Spacer(flex: 2),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*0.6,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x000F1115), // transparent
                        Color(0x470D0E12),
                        Color(0xA30B0C0F),
                        Color(0xCC090B0D),
                        Color(0xFF000000),
                      ],
                      stops: [0.02, 0.05, 0.15, 0.75, 1.0],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const BonfireQuestionCard(),
                      BonfireOptions(
                        selectedIndex: selectedOption,
                        onSelect: (i) {
                          setState(() {
                            selectedOption = i;
                          });
                        },
                      ),
                      const BonfireFooter(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavigationAppBar(),
          ),
        ],
      ),
    );
  }
}
