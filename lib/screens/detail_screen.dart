import 'package:flutter/material.dart';
import 'package:snackbar/model/email.dart';

//Página de los detalles del email
class DetailScreen extends StatelessWidget {
  final Email email;
  const DetailScreen({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Functional programming'), centerTitle: true),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("From: " + email.from,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Container(color: Theme.of(context).primaryColor, height: 1),
                const SizedBox(height: 10),
                Text(email.subject),
                Text(email.dateTime.toString().substring(0, 16),
                    style: const TextStyle(color: Colors.grey, height: 1.5)),
                const SizedBox(height: 10),
                Container(color: Theme.of(context).primaryColor, height: 1),
                const SizedBox(height: 10),
                Text(email.body),
              ],
            )));
  }
}
