// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      json['userName'] as String,
      json['description'] as String,
      DateTime.parse(json['time'] as String),
    )
      ..likes = json['likes'] as int
      ..isLiked = json['isLiked'] as bool
      ..isDisLiked = json['isDisLiked'] as bool
      ..replies = json['replies'] as List<dynamic>
      ..json = json['json'] as String;

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'likes': instance.likes,
      'userName': instance.userName,
      'description': instance.description,
      'isLiked': instance.isLiked,
      'isDisLiked': instance.isDisLiked,
      'time': instance.time.toIso8601String(),
      'replies': instance.replies,
      'json': instance.json,
    };
