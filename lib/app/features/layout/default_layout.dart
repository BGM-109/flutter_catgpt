import 'package:cat_gpt/app/core/constants/break_point.dart';
import 'package:cat_gpt/app/features/cats/cats_fence_widget.dart';
import 'package:cat_gpt/app/features/layout/footer.dart';
import 'package:cat_gpt/app/features/layout/header.dart';
import 'package:flutter/material.dart';

class DefalutLayout extends StatelessWidget {
  const DefalutLayout({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // 데스크탑
    if (width > BreakPoint.tablet) {
      return Scaffold(
        body: SafeArea(
          child: Row(
            children: [
              Container(
                width: 300,
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Header.fromContext(context),
                    const SizedBox(
                      height: 24,
                    ),
                    const CatsFenceWidget(),
                    const Spacer(),
                    Footer(
                      width: width,
                    ),
                  ],
                ),
              ),
              Expanded(child: child),
            ],
          ),
        ),
      );
    }
    // 모바일 & 태블릿
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Header.fromContext(context),
                const Spacer(),
                const CatsFenceWidget(),
                const SizedBox(
                  width: 24,
                )
              ],
            ),
            Expanded(child: child),
            Footer(
              width: width,
            ),
          ],
        ),
      ),
    );
  }
}
