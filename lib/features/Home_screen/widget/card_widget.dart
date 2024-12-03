import 'package:flutter/material.dart';

import '../../../core/config/Model/model.dart';
import '../../../core/utils/text_size.dart';

class CardWidget extends StatelessWidget {
  CardWidget({super.key, required this.listitem});
  final ListModel listitem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                listitem.title,
                style: const TextStyle(fontSize: TextSize.heading1),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                listitem.body,
                style: TextStyle(fontSize: TextSize.subheading),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
