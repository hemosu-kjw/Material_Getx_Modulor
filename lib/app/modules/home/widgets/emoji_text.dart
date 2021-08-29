import 'package:flutter/material.dart';

class EmojiText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final double emojiFontMultiplier;

  const EmojiText({
    required this.text,
    required this.style,
    this.emojiFontMultiplier = 1.3, // Increase by 30%
  });

  // Regex to match emojis: 이모티콘과 일치하는 정규식.
  static final regex = RegExp(
      "(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])");

  List<TextSpan> generateTextSpans(String text) {
    List<TextSpan> spans = [];
    final TextStyle emojiStyle = style.copyWith(
      fontSize: (style.fontSize! * emojiFontMultiplier),
      letterSpacing: 2,
    );

    text.splitMapJoin(
      regex,
      onMatch: (m) {
        spans.add(
          TextSpan(
            text: m.group(0),
            style: emojiStyle,
          ),
        );
        return "";
      },
      onNonMatch: (s) {
        spans.add(TextSpan(text: s));
        return "";
      },
    );
    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(children: generateTextSpans(text), style: style),
      ),
    );
  }
  /**
   *    NOTE: 사용방법 : fontsize * 1.2 배 크기.
        EmojiText(
          text: '참 잘했어요! \u{1f60d}',
          style: TextStyle(
            fontSize: 16,
          ),
          emojiFontMultiplier: 1.2,
        ),
   * 
   */
}
