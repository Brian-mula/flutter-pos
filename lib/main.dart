import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/Homepage.dart';
import 'package:pos/firebase_options.dart';
import 'package:pos/theme/custome_theme.dart';
import 'package:pos/views/auth/verify.dart';
import 'package:pos/views/auth_checker.dart';
import 'package:pos/views/landing_view.dart';
import 'package:pos/views/new_product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomeTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthChecker(),
        '/landing': (context) => const LandingPage(),
        '/home': (context) => const HomePage(),
        '/verify': (context) => const VerifyPage(),
        '/new-product': (context) => const NewProduct()
      },
    );
  }
}
