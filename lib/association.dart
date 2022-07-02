import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'user.dart';
import 'post.dart';
part 'association.g.dart';

@JsonSerializable()
class Association {
  String name = "";
  String Case;
  String title;
  String about;
  String image;
  //DateTime startDate = DateTime.now();
  String startDate = DateFormat('2022-07-01 17:30:08.653').format(DateTime.now());
  String associationMakerName; //String json user
  late int memberCount = 1;
  //late List<User> users;
  //late List<Post> posts;

  Association(
      this.name,
      this.Case,
      this.title,
      this.about,
      this.image,
      this.startDate,
      this.associationMakerName,
      //this.memberCount,
      //this.users,
      //this.posts
      );
  factory Association.fromJson(Map<String, dynamic> json) =>
      _$AssociationFromJson(json);
  Map<String, dynamic> toJson() => _$AssociationToJson(this);
  String json = jsonEncode(Association);

  void setMemberCount() {
    memberCount++;
  }

  void setDescription(String desc) {
    about = desc;
  }

  void setAssociationName(String name) {
    name = name;
  }

  int getMemberCount() {
    return memberCount;
  }

  String getDescription() {
    return about;
  }

  String getAssociationName() {
    return name;
  }

  String getAssociationMakerName() {
    return associationMakerName; //ToDo => change
  }

  String getStartDate() {
    return startDate;
  }
}
