import 'package:cat_gpt/app/features/chat/model/message_model.dart';

class ChatModel {
  final List<MessageModel> messages;

  ChatModel(this.messages);

  ChatModel inputPrompt(String prompt) {
    final newMsg = [
      ...messages,
      MessageModel(prompt, Role.user),
    ];
    return ChatModel(newMsg);
  }

  ChatModel botResponse(String response) {
    final newMsg = [
      ...messages,
      MessageModel(response, Role.assistant),
    ];
    return ChatModel(newMsg);
  }
}
