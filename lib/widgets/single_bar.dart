import 'package:budget_manager_app_ui/data/constants.dart';
import 'package:flutter/material.dart';

class SingleBar extends StatelessWidget {
  final String label;
  final double amountSpend;
  final double mostExpensive;

  final double _maxBarHeight = 150.0;

  SingleBar({this.label, this.amountSpend, this.mostExpensive});

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpend / mostExpensive * _maxBarHeight;
    return Column(
      children: <Widget>[
        Text(
          '\$${amountSpend.toStringAsFixed(2)}',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 6.0),
        Container(
          height: barHeight,
          width: 10.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          label,
          style: kSecondaryTextStyle,
        ),
      ],
    );
  }
}
