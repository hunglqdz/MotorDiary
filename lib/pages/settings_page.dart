import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:motor_diary/widgets/icon_widget.dart';

import 'account_settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static const keyNotifications = 'key-notifications';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            SettingsGroup(
              title: 'GENERAL',
              children: [
                const AccountSettings(),
                buildLogout(),
                buildDeleteAccount(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLogout() {
    return SimpleSettingsTile(
      title: 'Logout',
      leading: const IconWidget(icon: Icons.logout, color: Colors.blue),
      onTap: () {
        Settings.clearCache();
        print('Clicked Logout');
      },
    );
  }

  Widget buildDeleteAccount() {
    return SimpleSettingsTile(
      title: 'Delete Account',
      leading: const IconWidget(icon: Icons.no_accounts, color: Colors.red),
      onTap: () {
        print('Clicked Delete Account');
      },
    );
  }

  Widget buildNotifications() {
    return SwitchSettingsTile(
      title: 'Notifications',
      settingKey: keyNotifications,
      leading: const IconWidget(
        icon: Icons.notifications,
        color: Colors.orange,
      ),
    );
  }
}
