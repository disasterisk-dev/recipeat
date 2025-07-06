import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipeat/components/text_widgets.dart';
import 'package:recipeat/models/app_user.dart';
import 'package:recipeat/providers/auth_provider.dart';
import 'package:recipeat/screens/profile.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:recipeat/screens/home.dart';
import 'package:recipeat/screens/welcome/welcome.dart';
import 'package:recipeat/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: primaryTheme,
      home: Consumer(
        builder: (context, ref, child) {
          final AsyncValue<AppUser?> user = ref.watch(authProvider);

          return user.when(
            data: (value) {
              if (value == null) return const Welcome();

              return const Home();
            },
            error: (error, _) => ErrorText(error.toString()),
            loading: () => const BodyText("Loading..."),
          );
        },
      ),
    );
  }
}
