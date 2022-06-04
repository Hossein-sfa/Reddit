import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'AboutUs.dart';
import 'ToHome.dart';
import 'addCommunitie.dart';

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
            IconButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return  const ToHome (
                    );
                  },
                ),
              );
            }, icon: const Icon(Icons.home_filled))
            //ToDo => it must go to feed page
          ],
        ),
        body: SettingsList(
          sections: [
            SettingsSection(
                title: const Text('User', textAlign: TextAlign.left),
                tiles: [
                  SettingsTile(
                    leading: Row(
                      children: [
                        CircleAvatar(
                          //radius: 20,
                            backgroundImage: const AssetImage(
                                'assets/images/circleAvatar.png'),
                            child: InkWell(
                              onTap: () {},
                            )),
                      ],
                    ),
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
                      child:
                      const Icon(Icons.delete_rounded, color: Colors.red),

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
                leading: //ToDo => add new communities
                InkWell(
                  child: const Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
                  //ToDO => Go to login page
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return  const CreateProfile(
                            key: Key("Add Communities"),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              SettingsTile(
                title: const Text('Blocked Communities'),
                leading: InkWell(
                  child: const Icon(
                    Icons.block_rounded,
                    color: Colors.black87,
                  ),
                  //ToDO => Go to login page
                  onTap: () {},
                ),
              ),
            ]),
            SettingsSection(title: const Text('Posts'), tiles: [
              SettingsTile(
                title: const Text('Saved Posts'),
                leading:
                InkWell(
                  child: const Icon(Icons.save_alt_rounded),
                  //ToDO => Go to login page
                  onTap: () {},
                ),
              ),
              SettingsTile(
                title: const Text('Like Posts'),
                leading:
                InkWell(
                  child: const Icon(Icons.favorite_rounded, color: Colors.redAccent),
                  //ToDO => Go to login page
                  onTap: () {},
                ),
              ),
            ]),
            SettingsSection(title: const Text('Common'), tiles: [
              SettingsTile(
                title: const Text('Language'),
                description: const Text('English'),
                leading: //
                InkWell(
                  child: const Icon(Icons.language, color: Colors.blueAccent,),
                  //ToDO => Go to login page
                  onTap: () {},
                ),
              ),
              SettingsTile(
                title: const Text('About Us'),
                leading://
                InkWell(
                  child: const Icon(Icons.phone, color: Colors.brown),
                  //ToDO => Go to login page
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return  const ABUS (
                            key: Key("About us"),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ]),
          ],
        ));
  }
}
