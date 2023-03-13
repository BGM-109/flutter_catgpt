import 'package:cat_gpt/app/core/constants/break_point.dart';
import 'package:cat_gpt/app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    Future<void> launchURL(String url) async {
      final Uri uri = Uri.parse(url);
      if (!await launchUrl(uri)) {
        throw Exception('Could not launch $uri');
      }
    }

    final MainAxisAlignment align = width > BreakPoint.desktop
        ? MainAxisAlignment.end
        : MainAxisAlignment.center;
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: align,
          children: [
            Center(
                child: InkWell(
                    onTap: () async {
                      launchURL(Constants.gitUrl);
                    },
                    child: Text(
                      'By ${Constants.author}',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline),
                    )))
          ],
        ),
      ),
    );
  }
}
