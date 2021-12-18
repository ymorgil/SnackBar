import 'package:flutter/material.dart';
import 'package:snackbar/model/backend.dart';
import 'package:snackbar/widgets/email_widget.dart';

//Lista actualizable mediante los eventos del widget
class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  //Actualizar la lista con los cambios
  void update() {
    setState(() {});
  }

  void _showSnackBar(int tipo, int id) {
    //SnackBar snackbar = const SnackBar(content: Text("Elemento usado"));
    switch (tipo) {
      case 1:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text("Mensaje eliminado"),
          duration: const Duration(seconds: 5),
          //width: 280.0, // Width of the SnackBar.
          // padding: const EdgeInsets.all(2.0),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ));
        break;
      case 2:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Mensaje marcado como leído"),
            action: SnackBarAction(
              label: 'Cancelar',
              onPressed: () {
                Backend().unmarkEmailAsRead(id);
                update();
              },
            ),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SnackBar'), centerTitle: true),
      //Generación de la lista pasandole como parametros las fundiones de los
      //eventos que se realizarán en el widget email
      body: ListView(
        children: Backend()
            .getEmails()
            .map((email) => EmailWidget(
                email: email,
                onTap: Backend().markEmailAsRead,
                onLongPress: Backend().markEmailAsRead,
                onHorizontalDragEnd: Backend().deleteEmail,
                update: update,
                snackbar: _showSnackBar))
            .toList(),
      ),
    );
  }
}
