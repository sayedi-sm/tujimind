import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:tujimind/constants.dart';
import 'package:tujimind/screens/home_screen.dart';
import 'package:tujimind/screens/profile_screen.dart';
import 'package:tujimind/screens/shelter_screen.dart';
import 'package:tujimind/screens/slef_help_screen.dart';
import 'package:tujimind/screens/speak_screen.dart';

class MainScreen extends StatefulWidget {
  static const String id = "MainScreen";

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PersistentTabController _controller =
  PersistentTabController(initialIndex: 0);

  String _pageTitle = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Center(child: Text(_pageTitle)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.solidBell,
              size: 20,
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: PersistentTabView(
        context,
        controller: _controller,
        screenTransitionAnimation:
        const ScreenTransitionAnimation(animateTabTransition: true),
        onItemSelected: (index) {
          setState(() {
            switch (index) {
              case 0:
                _pageTitle = "";
                break;
              case 1:
                _pageTitle = "Find Therapist";
                break;
              case 2:
                _pageTitle = "Shelter";
                break;
              case 3:
                _pageTitle = "Self Help";
                break;
              case 4:
                _pageTitle = "Profile";
                break;
            }
          });
        },
        // handleAndroidBackButtonPress: false,
        screens: _buildScreens(),
        items: _buildNavBarsItems(),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const SpeakScreen(),
      const ShelterScreen(),
      const SelfHelpScreen(),
      const ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _buildNavBarsItems() {
    return List.generate(
      _bottomNavBarIcons.length,
          (index) =>
          PersistentBottomNavBarItem(
            icon: Icon(
              _bottomNavBarIcons[index][1],
              size: 20,
            ),
            title: (_bottomNavBarIcons[index][0]),
            activeColorPrimary: activeBottomNavBarColor,
            inactiveColorPrimary: inactiveBottomNavBarColor,
          ),
    );
  }

  final List<List<dynamic>> _bottomNavBarIcons = [
    ["home", FontAwesomeIcons.house],
    ["Speak", FontAwesomeIcons.userGroup],
    ["Shelter", FontAwesomeIcons.tableCellsLarge],
    ["Self Help", FontAwesomeIcons.bookOpen],
    ["Profile", FontAwesomeIcons.solidUser],
  ];
}
