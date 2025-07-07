import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';

class FunctionsService {

  static Future<void> helloWorld() async {

    final result = await FirebaseFunctions.instance.httpsCallable("helloWorld").call();

    print(result.data["message"]);
  }
}