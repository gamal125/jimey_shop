
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/Screens/FQA/fqa_screen.dart';
import 'package:shop_app/Screens/edit/edit.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/state.dart';
import 'package:shop_app/shared/componnetns/components.dart';
import 'package:shop_app/shared/componnetns/constants.dart';
import 'package:shop_app/shared/mode_cubit/cubit.dart';
import 'package:shop_app/shared/styles/icon_broken.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    bool value = false;

    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {
        if (state is UserLoginSuccessStates) {}
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.cyan,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 90,
                            backgroundImage: NetworkImage(
                                'https://thumbs.dreamstime.com/b/nice-to-talk-smart-person-indoor-shot-attractive-interesting-caucasian-guy-smiling-broadly-nice-to-112345489.jpg'),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                          onPressed: () {
                            navigateTo(context, EditScreen());
                          },
                          icon: const Icon(
                            IconBroken.Edit_Square,
                            size: 30,
                          )),
                    ),
                  ],
                ),
                space(0, 20),
                InkWell(
                  onTap: () {
                    navigateTo(context, EditScreen());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        const Icon(
                          IconBroken.Profile,
                          color: Colors.cyan,
                          size: 35,
                        ),
                        space(15, 0),
                        const Text(
                          'My Profile',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigateTo(context, EditScreen());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        const Icon(
                          IconBroken.Notification,
                          color: Colors.cyan,
                          size: 35,
                        ),
                        space(15, 0),
                        const Text(
                          'Notifications',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigateTo(context, EditScreen());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.cyan,
                          size: 35,
                        ),
                        space(15, 0),
                        const Text(
                          'My Orders',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigateTo(context, EditScreen());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        const Icon(
                          IconBroken.Document,
                          color: Colors.cyan,
                          size: 35,
                        ),
                        space(15, 0),
                        const Text(
                          'Complaints',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.QUESTION,
                      animType: AnimType.TOPSLIDE,
                      title: 'Do you want to change mode?',
                      btnOkOnPress: () {
                        ModeCubit.get(context).changeAppMode();
                      },
                      btnCancelOnPress: () {},
                    ).show();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.dark_mode_outlined,
                          color: Colors.cyan,
                          size: 35,
                        ),
                        space(15, 0),
                        const Text(
                          'Theme Mode',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const Spacer(),
                        Switch(
                          value: value,
                          onChanged: (value) {
                            ModeCubit.get(context).changeAppMode();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigateTo(context, FqaScreen());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.fontAwesome,
                          color: Colors.cyan,
                          size: 35,
                        ),
                        space(15, 0),
                        const Text(
                          'FAQ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigateTo(context, EditScreen());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        const Icon(
                          IconBroken.Info_Circle,
                          color: Colors.cyan,
                          size: 35,
                        ),
                        space(15, 0),
                        const Text(
                          'About us',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.QUESTION,
                      animType: AnimType.RIGHSLIDE,
                      title: 'Do you want to Logout?',
                      desc: "Please, Login soon 🤚",
                      btnOkOnPress: () {
                        logOut(context);
                      },
                      btnCancelOnPress: () {},
                    ).show();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        const Icon(
                          IconBroken.Logout,
                          color: Colors.cyan,
                          size: 35,
                        ),
                        space(15, 0),
                        const Text(
                          'Log Out',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
