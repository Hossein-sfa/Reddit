import 'package:reddit/user.dart';
import 'post.dart';
import 'package:json_annotation/json_annotation.dart';
part  'association.g.dart';

@JsonSerializable()
class association {
  late String name;
  late String Case;
  late String title;
  late String about;
  late String image;
  DateTime startDate = DateTime.now();
  late String associationMakerName;
  late int memberCount = 1;
  //late var users = new List[5];
  //late var posts;

  association(
      this.name,
      this.Case,
      this.title,
      this.about,
      this.image,
      this.startDate,
      this.associationMakerName,
      this.memberCount,
      //this.users,
      //this.posts
     );

  Map<String, dynamic> toJson() => _$associationToJson(this);
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
