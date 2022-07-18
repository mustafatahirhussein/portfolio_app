import 'package:flutter/material.dart';

class WorkHistory extends StatelessWidget {
  const WorkHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: ["Parazelsus","Chimp","Solution Hub","Codegasm Solutions"].map((e) {
        return Card(
          child: ListTile(
            title: Text(e),
          ),
        );
      }).toList(),
    );
  }
}
