import 'package:flutter/material.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            autofocus: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.description),
              label: Text('Task'),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null) {
                return 'please enter task';
              }
              if (value.isEmpty) {
                return 'Please enter task';
              }
              int minLength = 3;

              if (value.length < minLength) {
                return 'Task must be at least $minLength characters long';
              }

              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('ADD TASK'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Processing Data'),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
