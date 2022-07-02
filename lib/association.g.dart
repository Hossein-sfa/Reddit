// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'association.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Association _$AssociationFromJson(Map<String, dynamic> json) => Association(
  json['name'] as String,
  json['Case'] as String,
  json['title'] as String,
  json['about'] as String,
  json['image'] as String,
  json['startDate'] as String,
  json['associationMakerName'] as String,
  json['memberCount'] as int,
)..json = json['json'] as String;

Map<String, dynamic> _$AssociationToJson(Association instance) =>
    <String, dynamic>{
      'name': instance.name,
      'Case': instance.Case,
      'title': instance.title,
      'about': instance.about,
      'image': instance.image,
      'startDate': instance.startDate,
      'associationMakerName': instance.associationMakerName,
      'memberCount': instance.memberCount,
      'json': instance.json,
    };
