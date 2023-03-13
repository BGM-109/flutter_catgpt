import 'package:cat_gpt/app/core/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum Cats {
  cheeze,
  black,
  grey,
  pink,
}

extension CatsExtension on Cats {
  String get image {
    switch (this) {
      case Cats.black:
        return 'assets/cats/suit.jpeg';
      case Cats.cheeze:
        return 'assets/cats/cheeze.jpeg';
      case Cats.grey:
        return 'assets/cats/grey.jpeg';
      case Cats.pink:
        return 'assets/cats/pink.jpeg';
    }
  }

  MaterialColor get color {
    switch (this) {
      case Cats.black:
        return Palette.primaryBlack;
      case Cats.cheeze:
        return Colors.brown;
      case Cats.grey:
        return Colors.blueGrey;
      case Cats.pink:
        return Colors.pink;
    }
  }

  String get name {
    switch (this) {
      case Cats.black:
        return '턱시도냥이';
      case Cats.cheeze:
        return '치즈냥이';
      case Cats.grey:
        return '샴냥이';
      case Cats.pink:
        return '젤리냥이';
    }
  }

  String get description {
    switch (this) {
      case Cats.black:
        return '모험적이고 호기심이 많은 고양이';
      case Cats.cheeze:
        return '내성적이고 독립적인 고양이';
      case Cats.grey:
        return '자신감있고 외향적인 고양이';
      case Cats.pink:
        return '차분하고 껴안고 싶은 고양이';
    }
  }
}

final catsProvider = StateProvider<Cats>((ref) => Cats.cheeze);
