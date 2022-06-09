import 'package:flutter/material.dart';
import 'user.dart';
import 'communitydetails.dart';

class Communities extends StatelessWidget {
  const Communities({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Text(
                'Favorites',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: User.favCommunities.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/circleAvatar.png'),
                    ),
                    title: Text(User.favCommunities[index].associationName),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityDetails(
                              community: User.favCommunities[index]),
                        ),
                      );
                    },
                  );
                },
              ),
              const Divider(thickness: 0.8),
              Text(
                'Other communities',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: User.favCommunities.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/circleAvatar.png'),
                    ),
                    title: Text(User.favCommunities[index].associationName),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityDetails(
                              community: User.communities[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
