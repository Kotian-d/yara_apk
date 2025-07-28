import 'package:flutter/material.dart';

class KYCUpdate extends StatefulWidget {
  const KYCUpdate({super.key});

  @override
  State<KYCUpdate> createState() => _KYCUpdateState();
}

class _KYCUpdateState extends State<KYCUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KYC Update"),
        backgroundColor: Colors.green.shade200,
      ),
      body: Center(child: Text("KYC Update Screen")),
    );
  }
}
