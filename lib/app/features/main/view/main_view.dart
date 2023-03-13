import 'package:cat_gpt/app/features/chat/providers/chat_list_controller.dart';
import 'package:cat_gpt/app/features/chat/view/chat_view.dart';
import 'package:cat_gpt/app/features/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainView extends HookConsumerWidget {
  const MainView({super.key});

  static const String routeName = '/main';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = useTextEditingController();
    final focus = useFocusNode();

    return DefalutLayout(
      child: Column(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            color: Colors.white,
            child: const ChatListView(),
          )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            color: Colors.white,
            child: TextFormField(
              maxLength: 100,
              controller: text,
              focusNode: focus,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onFieldSubmitted: (String? prompt) {
                if (prompt == null || prompt.isEmpty) {
                  return;
                }

                ref.read(chatListControllerProvider.notifier).sendPrompt(
                      prompt: prompt,
                      sendSuccess: () {
                        text.clear();
                      },
                      onSuccess: () {
                        focus.requestFocus();
                      },
                    );
              },
              // onSubmitted: (String? prompt) {

              // },
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.send),
                  filled: true,
                  focusColor: Theme.of(context).primaryColor,
                  suffixIconColor: Theme.of(context).primaryColor,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none),
                  hintText: 'Type ur message here...'),
            ),
          ),
        ],
      ),
    );
  }
}
