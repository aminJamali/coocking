import 'package:flutter/material.dart';

class DescriptionLable extends StatelessWidget {
  final String title, description;

  const DescriptionLable({
    required final this.title,
    required final this.description,
  });
  @override
  Widget build(final BuildContext context) {
    final column = Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[500],
            ),
          ),
          trailing: Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        const Divider(
          height: 10,
          color: Colors.grey,
        ),
      ],
    );
    return column;
  }
}
