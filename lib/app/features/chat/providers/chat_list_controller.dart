import 'package:cat_gpt/app/features/chat/model/bot_response_model.dart';
import 'package:cat_gpt/app/features/chat/providers/chat_providers.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'chat_list_controller.g.dart';

@riverpod
class ChatListController extends _$ChatListController {
  @override
  FutureOr build() {}

  Future sendPrompt({
    required String prompt,
    required VoidCallback sendSuccess,
    required VoidCallback onSuccess,
  }) async {
    // Sending
    ref
        .read(getChatListProvider.notifier)
        .update((state) => state.inputPrompt(prompt));

    final chats = ref.read(getChatListProvider);

    sendSuccess();

    final repository = ref.read(chatRepositoryProvider);

    state = const AsyncLoading();

    final body = {
      'model': 'gpt-3.5-turbo-0301',
      "messages": chats.messages,
    };

    state = await AsyncValue.guard(() => repository.getChatResponse(body));

    if (state is AsyncData && state.asData != null) {
      final BotResponseModel value = state.asData!.value as BotResponseModel;

      final message = value.choices.first.message.content;
      ref
          .read(getChatListProvider.notifier)
          .update((state) => state.botResponse(message));

      onSuccess();
    }
  }
}
