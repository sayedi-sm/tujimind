import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tujimind/constants.dart';
import 'package:tujimind/screens/main_screen.dart';
import 'package:tujimind/screens/special_groups_screen.dart';
import 'package:tujimind/widgets/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: assessmentScreenColor,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: activeBottomNavBarColor),
                ),
                width: 200,
                height: 200,
                child: const Icon(
                  FontAwesomeIcons.faceSmile,
                  color: activeBottomNavBarColor,
                  size: 100,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: activeBottomNavBarColor),
                  ),
                  width: 40,
                  height: 40,
                  child: const Icon(
                    FontAwesomeIcons.camera,
                    color: activeBottomNavBarColor,
                  ),
                ),
              ),
            ],
          ),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              CustomButton(
                  child: const Text("Change Avatar"), onPressed: () {}),
              CustomButton(
                child: const Text("Special Groups"),
                onPressed: () =>
                    Navigator.of(MainScreen.universalContext!).pushNamed(SpecialGroupsScreen.id),
              ),
              CustomButton(
                  child: const Text("Invite Friends"), onPressed: () {}),
              CustomButton(child: const Text("Log out"), onPressed: () {}),
            ],
          ),
          TextButton(
            child: const Text(
              "Deactivate Account",
              style: TextStyle(
                color: Color(0xFF707070),
                fontSize: 12,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
