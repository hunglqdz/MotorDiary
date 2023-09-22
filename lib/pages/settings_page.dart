import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motor_diary/pages/profile_page.dart';
import 'package:motor_diary/widgets/constant.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool enableNotifications = false;
  String? selectedNumOfRecords;
  final List<String> numOfRecords = ['5', '10', '15'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView(
            children: [
              _SingleSection(
                title: "General",
                children: [
                  _CustomListTile(
                    title: const Text("Notifications"),
                    icon: Icon(CupertinoIcons.bell, color: primaryColor),
                    trailing: Switch(
                        value: enableNotifications,
                        onChanged: (value) {
                          setState(() {
                            enableNotifications = value;
                          });
                        }),
                    subtitle: '',
                  ),
                ],
              ),
              const Divider(),
              _SingleSection(
                title: "Organization",
                children: [
                  _CustomListTile(
                    title: const Text("Profile"),
                    icon: Icon(CupertinoIcons.person, color: primaryColor),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(
                              user: null,
                            ),
                          ));
                    },
                    subtitle: '',
                  ),
                  _CustomListTile(
                    title: const Text("Predictor"),
                    subtitle: 'Number of records for prediction',
                    icon: Icon(
                      CupertinoIcons.gauge,
                      color: primaryColor,
                    ),
                    trailing: dropDown(),
                  ),
                ],
              ),
              const Divider(),
              _SingleSection(
                children: [
                  _CustomListTile(
                    title: const Text("Sign out",
                        style: TextStyle(color: Colors.red)),
                    icon: const Icon(CupertinoIcons.return_icon,
                        color: Colors.red),
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                    },
                    subtitle: '',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dropDown({
    Widget? underline,
    Widget? icon,
    TextStyle? style,
    Color? dropdownColor,
    Color? iconEnabledColor,
  }) =>
      DropdownButton<String>(
          value: selectedNumOfRecords,
          underline: underline,
          icon: icon,
          dropdownColor: dropdownColor,
          style: style,
          iconEnabledColor: iconEnabledColor,
          onChanged: (String? newValue) {
            setState(() {
              selectedNumOfRecords = newValue;
            });
          },
          items: numOfRecords
              .map((value) =>
                  DropdownMenuItem<String>(value: value, child: Text(value)))
              .toList());
}

class _CustomListTile extends StatelessWidget {
  final Text title;
  final String subtitle;
  final Icon icon;
  final Widget? trailing;
  final Function()? onTap;
  const _CustomListTile({
    Key? key,
    required this.title,
    required this.icon,
    this.trailing,
    this.onTap,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      subtitle: Text(subtitle),
      leading: icon,
      trailing: trailing,
      onTap: onTap,
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  const _SingleSection({
    Key? key,
    this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              title!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        Column(
          children: children,
        ),
      ],
    );
  }
}
