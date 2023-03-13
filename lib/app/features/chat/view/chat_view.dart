import 'package:cat_gpt/app/features/cats/cats_providers.dart';
import 'package:cat_gpt/app/features/chat/model/chat_model.dart';
import 'package:cat_gpt/app/features/chat/providers/chat_list_controller.dart';
import 'package:cat_gpt/app/features/chat/providers/chat_providers.dart';
import 'package:cat_gpt/app/features/chat/widget/chat_loader.dart';
import 'package:cat_gpt/app/features/chat/widget/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatListView extends HookConsumerWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scroll = useScrollController();
    final chatList = ref.watch(getChatListProvider);
    final cats = ref.watch(catsProvider);
    // ignore: unused_local_variable
    final controller = ref.watch(chatListControllerProvider);
    ref.listen<ChatModel>(getChatListProvider, (previous, next) {
      if (previous?.messages.length != next.messages.length) {
        Future.delayed(const Duration(milliseconds: 500), () {
          scroll.animateTo(scroll.position.maxScrollExtent,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut);
        });
      }
    });
    ref.listen(chatListControllerProvider, (_, state) {
      if (state is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.error.toString()),
          ),
        );
      }
    });
    return ListView.builder(
      controller: scroll,
      itemCount: controller.isLoading
          ? chatList.messages.length + 1
          : chatList.messages.length,
      itemBuilder: (context, index) {
        if (controller.isLoading && index == chatList.messages.length) {
          return ChatLoader(
            imgPath: cats.image,
          );
        }
        final chat = chatList.messages[index];
        return ChatWidget(
          botImage: cats.image,
          role: chat.role,
          text: chat.content,
        );
      },
    );
  }
}
