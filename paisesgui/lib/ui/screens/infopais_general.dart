
import 'package:flutter/material.dart';
import 'package:paisesgui/data/repositories/paises_repository.dart';
import 'package:paisesgui/domain/entities/pais.dart';

class InfoPaisGeneral extends StatelessWidget {
  InfoPaisGeneral({super.key});

    // Referencia al repositorio, de donde obtendremos la lista de continentes
  final PaisesRepository _repository = PaisesRepository();


  @override
  Widget build(BuildContext context) {

    // Recogemos el país del repositorio
    Pais pais = _repository.infoPais();
    
    // TO-DO
    // Añadir la información siguiente sobre el país:
    // Imagen, nombre, capital y descripción, de forma similar a como se muestra en el enunciado

    // Podéis utilizar los widgets y contenedores que consideréis oportunos (Containers, SingleChildScrollView, Columns, etc)
    // Debéis tener en cuenta no sobrepasar los límites y dibujar fuera del espacio disponible
    // Para comprobar que no os salís, podéis probar a girar el dispositivo (si lo estáis haciendo sobre Android)

    return Scaffold(
           
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagen del país
                  Padding(padding: const EdgeInsets.all(20.0),
                                    
                          child: 
                                Image.network(
                                pais.imagen ?? "",
                                width: double.infinity,
                                height: 250,
                                fit: BoxFit.cover,
                                ),
                          ),


                  // Nombre del país
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      style: const TextStyle(fontSize: 25),
                      pais.nombre,
                    ),
                  ),


                  // Capital
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      children: [
                        const Text(
                          "Capital: ",
                          style: const TextStyle(fontSize: 16),

                        ),
                        Expanded(
                          child: Text(pais.capital ?? "No disponible",
                                      style: const TextStyle(fontSize: 16)
                                      ),
                        ),
                      ],
                    ),
                  ),


                  // Descripción
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 28),
                    child: Text(
                      style: const TextStyle(fontSize: 12),
                      pais.descripcion ?? "Sin descripción disponible",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
