import 'package:cat_gpt/app/features/chat/model/message_model.dart';
import 'package:cat_gpt/app/features/chat/widget/bot_avatar_widget.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget(
      {super.key,
      required this.role,
      required this.text,
      required this.botImage});
  final Role role;
  final String text;
  final String botImage;

  @override
  Widget build(BuildContext context) {
    if (role == Role.system) {
      return Container();
    }

    Color getColor() {
      if (role == Role.assistant) {
        return Colors.grey[100]!;
      }

      return Theme.of(context).primaryColor;
    }

    Color getTextColor() {
      if (role == Role.assistant) {
        return Colors.black;
      }

      return Colors.white;
    }

    Widget getAvatar() {
      if (role == Role.assistant) {
        return BotAvatarWidget(size: 40, path: botImage);
      }

      return Container();
    }

    final String trimed = text.trim();

    final List<Widget> child = [
      getAvatar(),
      Flexible(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
                color: getColor(), borderRadius: BorderRadius.circular(12)),
            child: Text(
              trimed,
              style: TextStyle(
                  color: getTextColor(),
                  fontWeight: FontWeight.w500,
                  fontSize: 13),
            )),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: role.mainAxisAlignment,
        children: role == Role.assistant ? child : child.reversed.toList(),
      ),
    );
  }
}
