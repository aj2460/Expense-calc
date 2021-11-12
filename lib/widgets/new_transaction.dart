import "package:flutter/material.dart";

class NewTransaction extends StatelessWidget {
  //const NewTransaction({Key? key}) : super(key: key);

  final titleControler = TextEditingController();
  final amountController = TextEditingController();

  final Function _addTransactionHandler;

  NewTransaction(this._addTransactionHandler);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleControler,
              //onChanged: (val) => titleIInpt = val,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              // onChanged: (val) => amountInput = val,
            ),
            TextButton(
              onPressed: () {
                _addTransactionHandler(
                  titleControler.text,
                  double.parse(amountController.text),
                );
              },
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
