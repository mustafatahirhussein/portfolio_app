import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Theme.of(context).primaryColor,
      child: const Center(
        child: Text(
          "All rights reserved 2022"
        ),
      ),
    );
  }
}
