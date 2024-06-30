import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

class BulletPoint extends StatelessWidget {
  const BulletPoint({super.key, required this.text, this.highlightedText});

  final String text;
  final String? highlightedText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '●   ',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.white),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: <InlineSpan>[
                TextSpan(
                  text: text,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                if (highlightedText != null)
                  TextSpan(
                    text: highlightedText,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: AppColors.yellow),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
