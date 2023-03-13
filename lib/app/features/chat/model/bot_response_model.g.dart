// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotResponseModel _$BotResponseModelFromJson(Map<String, dynamic> json) =>
    BotResponseModel(
      json['id'] as String,
      json['object'] as String,
      json['created'] as int,
      json['model'] as String,
      (json['choices'] as List<dynamic>)
          .map((e) => Chioce.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['usage'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$BotResponseModelToJson(BotResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'choices': instance.choices,
      'usage': instance.usage,
    };

Chioce _$ChioceFromJson(Map<String, dynamic> json) => Chioce(
      json['index'] as int,
      json['finish_reason'] as String?,
      MessageModel.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChioceToJson(Chioce instance) {
  final val = <String, dynamic>{
    'index': instance.index,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('finish_reason', instance.finishReason);
  val['message'] = instance.message;
  return val;
}
