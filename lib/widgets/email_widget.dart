import 'package:flutter/material.dart';
import 'package:snackbar/model/email.dart';
import 'package:snackbar/screens/detail_screen.dart';

//Widget de los componentes de la lista
class EmailWidget extends StatelessWidget {
  final Email email;
  final Function onTap;
  final Function onLongPress;
  final Function onHorizontalDragEnd;
  final Function update;
  final Function snackbar;

  const EmailWidget(
      {Key? key,
      required this.email,
      required this.onTap,
      required this.onLongPress,
      required this.onHorizontalDragEnd,
      required this.update,
      required this.snackbar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Gestor de gestos que ejecutará las funciones pasadas por el listview
    return GestureDetector(
      onTap: () {
        //Al pulsar ejecuto las funciones de leido y actualizado de la lista
        //y muestra la página de los detalles del email
        onTap(email.id);
        update();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(email: email)),
        );
      },
      onLongPress: () {
        onLongPress(email.id);
        update();
        //if (!email.read)
        snackbar(2, email.id);
      },
      onHorizontalDragEnd: (details) {
        onHorizontalDragEnd(email.id);
        update();
        snackbar(1, email.id);
      },
      //Comienza la parte gráfica de la aplicación
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Row(
          children: <Widget>[
            //Si el email no esta leido dibujamos el boton sino dejamos espacio
            (!email.read)
                ? SizedBox(
                    child: FloatingActionButton(
                        heroTag: email.id, onPressed: () => {}),
                    width: 10)
                : const SizedBox(width: 10),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  Text(
                    email.dateTime.toString().substring(0, 10),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    email.from,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, height: 1.2),
                  ),
                  Text(email.subject, style: const TextStyle(height: 1.2)),
                  const SizedBox(height: 10),
                  //Línea del color primario del tema que separa cada elemento
                  //widget del siguiente
                  Container(color: Theme.of(context).primaryColor, height: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
