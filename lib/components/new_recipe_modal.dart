import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipeat/components/styled_button.dart';
import 'package:recipeat/components/text_input.dart';
import 'package:recipeat/components/text_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:recipeat/services/functions_service.dart';

class NewRecipeModal extends StatefulWidget {
  const NewRecipeModal({super.key});

  @override
  State<NewRecipeModal> createState() => _NewRecipeModalState();
}

class _NewRecipeModalState extends State<NewRecipeModal> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _urlController = TextEditingController();
  String? errorFeedback;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 8,
            children: [
              Center(child: HeadingText("New Recipe")),
              StyledButton(
                onPressed: () => FunctionsService.helloWorld(),
                label: "Write Recipe",
                icon: Icons.edit_rounded,
              ),
              Center(child: BodyText("or")),
              Form(
                key: _formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Expanded(
                      child: StyledTextInput(
                        controller: _urlController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a valid URL";
                          }

                          if (!Uri.parse(value).isAbsolute) {
                            return "Please enter a valid URL";
                          }

                          return null;
                        },
                        label: "From URL",
                      ),
                    ),
                    IntrinsicHeight(
                      child: StyledButton(
                        onPressed: () async {
                          setState(() {
                            errorFeedback = null;
                          });

                          if (_formKey.currentState!.validate()) {
                            final url = _urlController.text.trim();

                            // TODO: Replace external API with Firebase Cloud Function
                            var response = await http.get(
                              Uri.parse(
                                "http://192.168.0.37:3000/api?url=" + url,
                              ),
                            );

                            print(jsonDecode(response.body));

                            // setState(() {
                            //   errorFeedback = userRes.error;
                            // });

                            // error feedback
                          }
                        },
                        label: "Save",
                        icon: Icons.link_rounded,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
