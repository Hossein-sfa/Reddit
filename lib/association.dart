import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'user.dart';
import 'post.dart';

part 'association.g.dart';

@JsonSerializable()
class Association {
  late String name;
  late String Case;
  late String title;
  late String about;
  late String image;
  DateTime startDate = DateTime.now();
  User associationMakerName; //String json user
  late int memberCount = 1;
  late List<User> users;
  late List<Post> posts;

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

  User getAssociationMakerName() {
    return associationMakerName; //ToDo => change
  }

  DateTime getStartDate() {
    return startDate;
  }
}
