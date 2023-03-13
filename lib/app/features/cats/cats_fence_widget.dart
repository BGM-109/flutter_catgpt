import 'package:cat_gpt/app/core/constants/break_point.dart';
import 'package:cat_gpt/app/features/cats/cats_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CatsFenceWidget extends ConsumerWidget {
  const CatsFenceWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    Widget buildCatsList(bool isMobile) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Wrap(
          spacing: 12,
          children: Cats.values
              .map((c) => InkWell(
                    onTap: () {
                      ref.read(catsProvider.notifier).state = c;
                      if (isMobile) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(c.image),
                      ),
                    ),
                  ))
              .toList(),
        ));

    if (width > BreakPoint.desktop) {
      return buildCatsList(false);
    }

    void showCatsDialog() => showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("고양이를 선택해주세요"),
              content: buildCatsList(true),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "닫기",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    )),
              ],
            ));

    return TextButton(
        onPressed: () => showCatsDialog(),
        child: Text(
          "다른냥이보기",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ));
  }
}
