import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class Setting extends StatefulWidget {
  const Setting({required Key key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingPage();
}

class _SettingPage extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0X73000000),
          actions: [
            const Text("Setting Page"),
            IconButton(onPressed: () {}, icon: const Icon(Icons.home_filled))
            //ToDo => it must go to feed page
          ],
        ),
        body: SettingsList(sections: [
          SettingsSection(title: 'Communities', tiles: [
            SettingsTile(
                title: 'Add New Communities',
                leading: const Icon(Icons.add),
                onTap: () {}),
            SettingsTile(
                title: 'Blocked Communities',
                leading: const Icon(Icons.block_rounded),
                onTap: () {}),
          ]),
          SettingsSection(title: 'Posts', tiles: [
            SettingsTile(
                title: 'Saved Posts',
                leading: const Icon(Icons.save_alt_rounded),
                onTap: () {}),
            SettingsTile(
                title: 'Like Posts',
                leading:
                    const Icon(Icons.favorite_rounded, color: Colors.redAccent),
                onTap: () {}),
          ]),
          SettingsSection(title: 'Common', tiles: [
            SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: const Icon(
                  Icons.language,
                  color: Colors.blueAccent,
                ),
                onTap: () {}),
            SettingsTile(
                title: 'About Us',
                leading: const Icon(Icons.phone),
                onTap: () {}),
          ]),
        ]));
  }
}
