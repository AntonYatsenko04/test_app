import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final String boldText;
  final String thinText;
  const Section({
    super.key,
    required this.boldText,
    required this.thinText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          boldText,
        ),
        Text(
          thinText,
          style: theme.bodySmall,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
