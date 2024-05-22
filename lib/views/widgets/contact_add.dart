import 'package:flutter/material.dart';

class ContactAdd extends StatefulWidget {
  const ContactAdd({super.key});

  @override
  State<ContactAdd> createState() => _ContactAddState();
}

class _ContactAddState extends State<ContactAdd> {
  final _formkey = GlobalKey<FormState>();
  String task = '';
  String date = '';

  add() {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      Navigator.pop(context, {'task': task, 'date': date});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: AlertDialog(
        title: const Text('Add task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              onSaved: (newValue) {
                if (newValue != null) {
                  task = newValue;
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please add task';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Add task',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              onSaved: (newValue) {
                if (newValue != null) {
                  date = newValue;
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please add date';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Add date',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel ❌')),
          ElevatedButton(
              onPressed: add,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('Done ✅'))
        ],
      ),
    );
  }
}
