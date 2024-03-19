import 'package:flutter/material.dart';

class PersonCounter extends StatelessWidget {
  const PersonCounter({
    super.key,
    required this.theme,
    required int personCount,
    required this.onDrecrement,
    required this.onIncrement,
  }) : _personCount = personCount;

  final ThemeData theme;
  final int _personCount;
  final VoidCallback onDrecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Split',
          style: theme.textTheme.titleMedium,
        ),
        Row(
          children: [
            IconButton(
                color: theme.colorScheme.primary,
                onPressed: onDrecrement,
                icon: const Icon(Icons.remove)),
            Text("$_personCount", style: theme.textTheme.titleMedium),
            IconButton(
                color: theme.colorScheme.primary,
                onPressed: onIncrement,
                icon: const Icon(Icons.add))
          ],
        )
      ],
    );
  }
}
