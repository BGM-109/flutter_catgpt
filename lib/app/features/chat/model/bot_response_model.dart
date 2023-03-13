import 'package:cat_gpt/app/features/chat/model/message_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'bot_response_model.g.dart';

@JsonSerializable()
class BotResponseModel {
  final String id;
  final String object;
  final int created;
  final String model;
  final List<Chioce> choices;
  final Map<String, dynamic> usage;

  BotResponseModel(
      this.id, this.object, this.created, this.model, this.choices, this.usage);

  factory BotResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BotResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$BotResponseModelToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Chioce {
  final int index;
  @JsonKey(name: 'finish_reason')
  final String? finishReason;
  final MessageModel message;
  Chioce(this.index, this.finishReason, this.message);

  factory Chioce.fromJson(Map<String, dynamic> json) => _$ChioceFromJson(json);
  Map<String, dynamic> toJson() => _$ChioceToJson(this);
}





// Example
// {
//   "id": "chatcmpl-6p5FEv1JHictSSnDZsGU4KvbuBsbu",
//   "object": "messages",
//   "created": 1677693600,
//   "model": "gpt-3.5-turbo",
//   "choices": [
//     {
//       "index": 0,
//       "finish_reason": "stop",
//       "message": {
//         "role": "assistant",
//         "content": "OpenAI's mission is to ensure that artificial general intelligence benefits all of humanity."
//       }
//     }
//   ],
//   "usage": {
//     "prompt_tokens": 20,
//     "completion_tokens": 18,
//     "total_tokens": 38
//   }
// }