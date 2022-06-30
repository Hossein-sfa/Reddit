// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
  json['title'] as String,
  json['description'] as String,
  DateTime.parse(json['time'] as String),
  json['userName'] as String,
  json['community'] as String,
  (json['comments'] as List<dynamic>)
      .map((e) => Comment.fromJson(e as Map<String, dynamic>))
      .toList(),
)
  ..likes = json['likes'] as int
  ..isLiked = json['isLiked'] as bool
  ..isDisLiked = json['isDisLiked'] as bool
  ..json = json['json'] as String;

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'userName': instance.userName,
  'community': instance.community,
  'likes': instance.likes,
  'comments': instance.comments,
  'time': instance.time.toIso8601String(),
  'isLiked': instance.isLiked,
  'isDisLiked': instance.isDisLiked,
  'json': instance.json,
};