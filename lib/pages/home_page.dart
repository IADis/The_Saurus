import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../components/icons/s_icons.dart';
import 'animals/animals_page.dart';
import 'insects/insects_page.dart';
import 'settings/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [
    const InsectsPage(),
    const AnimalsPage(),
    const Profile(),
  ];
  int _selectTab = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Insects',
      style: optionStyle,
    ),
    Text(
      'Animals',
      style: optionStyle,
    ),
    Text(
      'Settings',
      style: optionStyle,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(
              40,
            ),
            bottomRight: Radius.circular(
              40,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(
                    40,
                  ),
                  bottomRight: Radius.circular(
                    40,
                  ),
                ),
              ),
            ),
          ),
        ),
        title: _widgetOptions.elementAt(_selectTab),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(
            20,
          ),
          topRight: Radius.circular(
            20,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(
                  20,
                ),
                topRight: Radius.circular(
                  20,
                ),
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: GNav(
                curve: Curves.bounceIn,
                duration: const Duration(milliseconds: 900),
                backgroundColor: Colors.transparent,
                color: Colors.red,
                tabBorder: Border.all(color: Colors.red),
                gap: 2,
                padding: const EdgeInsets.all(10),
                tabs: const [
                  GButton(
                    icon: SIcons.spider,
                    text: 'Insects',
                  ),
                  GButton(
                    icon: SIcons.footprint,
                    text: 'Animals',
                  ),
                  GButton(
                    icon: Icons.settings_system_daydream,
                    text: 'Settings',
                  ),
                ],
                selectedIndex: _selectTab,
                onTabChange: (index) {
                  if (_selectTab == index) return;
                  setState(() {
                    _selectTab = index;
                  });
                }),
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectTab,
        children: pages,
      ),
      // Container(
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //       fit: BoxFit.cover,
      //       image: AssetImage('assets/images/font.jpg'),
      //     ),
      //   ),
      // ),
    );
  }
}
