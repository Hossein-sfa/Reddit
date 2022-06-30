// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'association.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

association _$associationFromJson(Map<String, dynamic> json) => association(
      json['name'] as String,
      json['Case'] as String,
      json['title'] as String,
      json['about'] as String,
      json['image'] as String,
      DateTime.parse(json['startDate'] as String),
      User.fromJson(json['associationMakerName'] as Map<String, dynamic>),
    )
      ..memberCount = json['memberCount'] as int
      ..users = (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList()
      ..posts = (json['posts'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList()
      ..json = json['json'] as String;

Map<String, dynamic> _$associationToJson(association instance) =>
    <String, dynamic>{
      'name': instance.name,
      'Case': instance.Case,
      'title': instance.title,
      'about': instance.about,
      'image': instance.image,
      'startDate': instance.startDate.toIso8601String(),
      'associationMakerName': instance.associationMakerName,
      'memberCount': instance.memberCount,
      'users': instance.users,
      'posts': instance.posts,
      'json': instance.json,
    };
