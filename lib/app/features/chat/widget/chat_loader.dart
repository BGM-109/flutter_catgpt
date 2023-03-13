import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cat_gpt/app/features/chat/widget/bot_avatar_widget.dart';
import 'package:flutter/material.dart';

class ChatLoader extends StatelessWidget {
  const ChatLoader({super.key, required this.imgPath});
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          BotAvatarWidget(path: imgPath, size: 40),
          const SizedBox(width: 12),
          Flexible(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12)),
                child: DefaultTextStyle(
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                  child: AnimatedTextKit(
                    isRepeatingAnimation: true,
                    animatedTexts: [
                      WavyAnimatedText('...',
                          speed: const Duration(milliseconds: 600)),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
