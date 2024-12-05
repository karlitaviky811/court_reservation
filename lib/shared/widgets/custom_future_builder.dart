import 'package:flutter/material.dart';

class CustomFutureBuilder<T, E> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(E instance, int index) onLoaded;

  const CustomFutureBuilder(
      {Key? key, required this.future, required this.onLoaded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (_, AsyncSnapshot snapshot) {
          // print(snapshot);

          if (snapshot.connectionState == ConnectionState.waiting) {
            // Si estamos cargando los datos, mostramos un indicador de carga
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Si hubo un error al cargar los datos, mostramos un mensaje de error
            return const Center(child: Text('Error al cargar los datos'));
          } else {
            return ListView.separated(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) =>
                    onLoaded(snapshot.data[index], index),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16));
          }
        });
  }
}
