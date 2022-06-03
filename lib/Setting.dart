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
        backgroundColor: const Color(0XFF616161), // gray design
        appBar: AppBar(
          backgroundColor: const Color(0X73000000),
          title: const Text("Setting Page",
              style: TextStyle(color: Colors.deepOrangeAccent)),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.home_filled))
            //ToDo => it must go to feed page
          ],
        ),
        body: SettingsList(
          sections: [
            SettingsSection(title: const Text('User'), tiles: [
              SettingsTile(
                leading: CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        const AssetImage('assets/images/circleAvatar.png'),
                    child: InkWell(
                      onTap: () {},
                    )),
                title: const Text('User Profile Setting'),
                //ToDo => add new communities
              ),
              SettingsTile(
                title: const Text('Communities List'),
                leading: InkWell(
                  child: const Icon(Icons.group_rounded),
                  onTap: () {},
                ),
              ),
              SettingsTile(
                title: const Text('Delete Account'),
                leading: InkWell(
                  child: const Icon(Icons.delete_rounded, color: Colors.red),
                  //ToDo => delete account from list ang go to Login page
                  onTap: () {},
                ),
              ),
              SettingsTile(
                title: const Text('Log out'),
                leading: InkWell(
                  child: const Icon(Icons.logout_rounded,
                      color: Colors.blueAccent),
                  //ToDO => Go to login page
                  onTap: () {},
                ),
              ),
            ]),
            SettingsSection(title: const Text('Communities'), tiles: [
              SettingsTile(
                title: const Text('Add New Communities'),
                leading: const Icon(
                  Icons.add,
                  color: Colors.green,
                ), //ToDo => add new communities
              ),
              SettingsTile(
                title: const Text('Blocked Communities'),
                leading: const Icon(
                  Icons.block_rounded,
                  color: Colors.black87,
                ),
              ),
            ]),
            SettingsSection(title: const Text('Posts'), tiles: [
              SettingsTile(
                title: const Text('Saved Posts'),
                leading: const Icon(Icons.save_alt_rounded),
              ),
              SettingsTile(
                title: const Text('Like Posts'),
                leading:
                    const Icon(Icons.favorite_rounded, color: Colors.redAccent),
              ),
            ]),
            SettingsSection(title: const Text('Common'), tiles: [
              SettingsTile(
                title: const Text('Language'),
                description: const Text('English'),
                leading: const Icon(
                  Icons.language,
                  color: Colors.blueAccent,
                ),
              ),
              SettingsTile(
                title: const Text('About Us'),
                leading: const Icon(Icons.phone, color: Colors.brown),
              ),
            ]),
          ],
        ));
  }
}