import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/Homepage.dart';
import 'package:pos/providers/authentication/auth_provider.dart';
import 'package:pos/views/landing_view.dart';
import 'package:pos/widgets/cutome_text.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
        data: (data) {
          if (data != null) return const HomePage();
          return const LandingPage();
        },
        error: (err, trace) => CustomeText(text: err.toString()),
        loading: () => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}
