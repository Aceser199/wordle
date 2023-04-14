import 'package:flutter/material.dart';

class LoadingContainerField extends StatelessWidget {
  const LoadingContainerField({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: buildContainer(context),
    );
  }

  Widget buildContainer(BuildContext context) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.zero,
      color: Theme.of(context).brightness == Brightness.light
          ? Colors.grey.shade200
          : Theme.of(context).colorScheme.surface,
    );
  }
}
