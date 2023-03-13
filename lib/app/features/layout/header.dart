import 'package:cat_gpt/app/core/constants/break_point.dart';
import 'package:cat_gpt/app/features/cats/cats_providers.dart';
import 'package:cat_gpt/app/features/chat/widget/bot_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.width});
  final double width;

  factory Header.fromContext(
    BuildContext context,
  ) {
    final width = MediaQuery.of(context).size.width;
    return Header(
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double size = width > BreakPoint.tablet ? 80 : 40;
    final Color backgroundColor =
        width > BreakPoint.tablet ? Colors.white : Colors.transparent;
    Widget buildMobile() => Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Consumer(builder: (contex, ref, child) {
            final Cats cats = ref.watch(catsProvider);
            return Row(
              children: [
                BotAvatarWidget(
                  size: size,
                  path: cats.image,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cats.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      width: 150,
                      child: Text(
                        cats.description,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        );
    Widget buildDesktop() => Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Consumer(builder: (context, ref, child) {
            final Cats cats = ref.watch(catsProvider);
            return Row(
              children: [
                BotAvatarWidget(
                  size: size,
                  path: cats.image,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cats.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: 100,
                      child: Text(
                        cats.description,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        );

    return width > BreakPoint.tablet ? buildDesktop() : buildMobile();
  }
}
