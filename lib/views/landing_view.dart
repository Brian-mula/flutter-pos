import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/widgets/cutome_text.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const CustomeText(text: "This is the Landing page"),
      ),
    );
  }
}
