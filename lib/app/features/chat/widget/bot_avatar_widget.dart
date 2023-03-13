import 'package:flutter/material.dart';

class BotAvatarWidget extends StatelessWidget {
  const BotAvatarWidget({super.key, required this.path, required this.size});
  final String path;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(99),
          image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover)),
    );
  }
}
