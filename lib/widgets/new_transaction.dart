import "package:flutter/material.dart";

class NewTransaction extends StatefulWidget {
  //const NewTransaction({Key? key}) : super(key: key);

  final Function _addTransactionHandler;

  NewTransaction(this._addTransactionHandler);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControler = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleControler.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) return;

    widget._addTransactionHandler(enteredTitle, enteredAmount);
  }

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
              onSubmitted: (_) => submitData(),
              //onChanged: (val) => titleIInpt = val,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            TextButton(
              onPressed: submitData,
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
