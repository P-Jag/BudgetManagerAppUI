import 'dart:math';

import 'package:budget_manager_app_ui/Wigets/single_bar.dart';
import 'package:budget_manager_app_ui/data/constants.dart';
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;
  BarChart({this.expenses});

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses.forEach((double price) {
      if (mostExpensive < price) {
        mostExpensive = price;
      }
    });

    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Text(
            'Weekly Spending',
            style: kPrimaryTextStyle,
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 30.0,
                onPressed: () {},
              ),
              Text(
                'Sep 6, 2020 - Sep 13, 2020',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                  fontSize: 18.0,
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                iconSize: 30.0,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SingleBar(
                label: 'Su',
                amountSpend: expenses[0],
                mostExpensive: mostExpensive,
              ),
              SingleBar(
                label: 'Mo',
                amountSpend: expenses[1],
                mostExpensive: mostExpensive,
              ),
              SingleBar(
                label: 'Tu',
                amountSpend: expenses[2],
                mostExpensive: mostExpensive,
              ),
              SingleBar(
                label: 'We',
                amountSpend: expenses[3],
                mostExpensive: mostExpensive,
              ),
              SingleBar(
                label: 'Tu',
                amountSpend: expenses[4],
                mostExpensive: mostExpensive,
              ),
              SingleBar(
                label: 'Fr',
                amountSpend: expenses[5],
                mostExpensive: mostExpensive,
              ),
              SingleBar(
                label: 'Sa',
                amountSpend: expenses[6],
                mostExpensive: mostExpensive,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
