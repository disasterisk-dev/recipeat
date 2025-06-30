import 'package:flutter/material.dart';
import 'package:recipeat/components/text_widgets.dart';

class NewRecipeModal extends StatelessWidget {
  const NewRecipeModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Center(child: HeadingText("New Recipe")),
        Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: () {
                    print("Written");
                  },
                  label: ButtonText("Write Recipe"),
                  icon: Icon(Icons.edit_rounded),
                ),
              ),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    print("Link");
                  },
                  label: SubheadingText("Save from Link"),
                  icon: Icon(Icons.link_rounded),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
