import 'package:flutter/material.dart';

class TotalPerPersonal extends StatelessWidget {
  const TotalPerPersonal({
    super.key,
    required this.style,
    required this.total,
    required this.theme,
  });

  final TextStyle style;
  final double total;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              "Total por pessoa",
              style: style,
            ),
            Text(
              total.toStringAsFixed(2),
              style: style.copyWith(
                fontSize: theme.textTheme.displaySmall?.fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
