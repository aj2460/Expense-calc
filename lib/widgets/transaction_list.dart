import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import "../models/transaction.dart";

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: _userTransactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No transaction added yet",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  margin: EdgeInsets.all(20),
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            _userTransactions[index].amount.toStringAsFixed(2),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      _userTransactions[index].title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(_userTransactions[index].date),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              },
              itemCount: _userTransactions.length,
            ),
    );
  }
}
