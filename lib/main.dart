import 'package:flutter/material.dart';
import 'package:pincode/pincode_screen/pin_code_page.dart';
// import 'package:widgets/pincode_screen/pin_code_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PinCodePage(),
    );
  }
}
