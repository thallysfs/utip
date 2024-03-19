import 'package:flutter/material.dart';

class AmountField extends StatelessWidget {
  const AmountField({
    super.key,
    required this.billAmount,
    required this.onChanged,
  });

  final String billAmount;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.attach_money),
          labelText: 'Total da conta'),
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        onChanged(value);
      },
    );
  }
}
