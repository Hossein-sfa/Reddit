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
      json['associationMakerName'] as String,
      json['memberCount'] as int,
    );

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
    };
