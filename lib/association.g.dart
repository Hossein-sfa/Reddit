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
    )
      ..startDate = DateTime.parse(json['startDate'] as String)
      ..associationMakerName = json['associationMakerName'] as String
      ..memberCount = json['memberCount'] as int
      ..users = json['users']
      ..posts = json['posts']
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
