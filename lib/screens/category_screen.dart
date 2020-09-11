import 'package:budget_manager_app_ui/data/constants.dart';
import 'package:budget_manager_app_ui/helpers/color_helper.dart';
import 'package:budget_manager_app_ui/models/expense_model.dart';
import 'package:budget_manager_app_ui/widgets/radial_painter.dart';
import 'package:flutter/material.dart';
import 'package:budget_manager_app_ui/models/category_model.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;

  CategoryScreen({this.category});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  _buildExpenses() {
    List<Widget> expensesList = [];
    widget.category.expenses.forEach((Expense expense) {
      expensesList.add(
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          height: 80.0,
          width: double.infinity,
          decoration: kMainBoxDecoration,
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  expense.name,
                  style: kPrimaryTextStyle,
                ),
                Text(
                  '-\$${(expense.cost.toStringAsFixed(2))}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
    return Column(
      children: expensesList,
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalAmountSpend = 0;
    widget.category.expenses.forEach((Expense expense) {
      totalAmountSpend += expense.cost;
    });
    final totalAmountLeft = widget.category.maxAmount - totalAmountSpend;
    double percent = totalAmountLeft / widget.category.maxAmount;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 30.0,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.all(15.0),
              height: 250.0,
              width: double.infinity,
              decoration: kMainBoxDecoration,
              child: CustomPaint(
                foregroundPainter: RadialPainter(
                  bgColor: Colors.grey[300],
                  lineColor: getColor(context, percent),
                  percent: percent,
                  width: 15.0,
                ),
                child: Center(
                  child: Text(
                    '\$${(totalAmountLeft.toStringAsFixed(2))} / '
                    '\$${widget.category.maxAmount}',
                    style: kSecondaryTextStyle,
                  ),
                ),
              ),
            ),
            _buildExpenses(),
          ],
        ),
      ),
    );
  }
}
