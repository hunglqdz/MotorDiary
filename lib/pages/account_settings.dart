import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:motor_diary/widgets/icon_widget.dart';

import 'account_page.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: 'Account Settings',
      subtitle: 'Username, Email, Password',
      leading: const IconWidget(
        icon: Icons.person,
        color: Colors.green,
      ),
      child: const AccountPage(),
    );
  }
}
