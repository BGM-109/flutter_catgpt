import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

enum Role {
  @JsonValue('assistant')
  assistant,
  @JsonValue('user')
  user,
  @JsonValue('system')
  system,
}

extension RoleExtension on Role {
  TextAlign get align {
    switch (this) {
      case Role.user:
        return TextAlign.end;
      case Role.assistant:
        return TextAlign.start;
      case Role.system:
        return TextAlign.start;
    }
  }

  MainAxisAlignment get mainAxisAlignment {
    switch (this) {
      case Role.assistant:
        return MainAxisAlignment.start;
      case Role.user:
        return MainAxisAlignment.end;
      case Role.system:
        return MainAxisAlignment.center;
    }
  }
}

@JsonSerializable()
class MessageModel {
  final String content;
  final Role role;

  MessageModel(this.content, this.role);

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
