import 'package:flutter/material.dart';

class SplitTextTwoLines extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const SplitTextTwoLines({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final words = text.split(' ');

    // لو أقل من أو يساوي 4 كلمات، نعرضهم عادي
    if (words.length <= 3) {
      return Text(text, style: style);
    }

    // لو أكتر من 4 كلمات، نأخذ أول 4 ونحط "... "
    final trimmedText = words.take(3).join(' ') + '...';

    return Text(
      trimmedText,
      style: style,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
