import 'package:reddit/user.dart';

import 'post.dart';
class association {
  late String Name;
  late String Case;
  late String Title;
  late String about;
  late String image;
  DateTime startDate = DateTime.now();
  late String associationMakerName;
  late int memberCount = 1;
  List<User> users = [];
  List<Post> posts = [];

  association(
      this.Name,
      this.Case,
      this.Title,
      this.about,
      this.image,
      this.startDate,
      this.associationMakerName,
      this.memberCount,
      this.users,
      this.posts);

  void setMemberCount() {
    memberCount++;
  }

  void setDescription(String desc) {
    about = desc;
  }

  void setAssociationName(String name) {
    Name = name;
  }

  int getMemberCount() {
    return memberCount;
  }

  String getDescription() {
    return about;
  }

  String getAssociationName() {
    return Name;
  }

  String getAssociationMakerName() {
    return associationMakerName;
  }

  DateTime getStartDate() {
    return startDate;
  }
}
