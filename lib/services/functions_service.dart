
import 'package:cloud_functions/cloud_functions.dart';

class FunctionsService {

  static Future<void> helloWorld() async {

    final result = await FirebaseFunctions.instance.httpsCallable("helloWorld").call();

    print(result.data["message"]);
  }

  static Future<dynamic> fetchRecipe(String url) async {
    final result = await FirebaseFunctions.instance.httpsCallable("scrapeRecipe").call({
      url: url
    });

    if(result.data != null) return result.data;

    return null;
  }
}