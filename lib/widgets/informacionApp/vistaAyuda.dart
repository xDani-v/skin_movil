import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesis/globals.dart';

class AyudaWidget extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Como tomar la foto"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildConsejo(
              '1. Encuadre del Rostro:',
              'Asegúrate de que tu rostro ocupe la mayor parte posible del encuadre. Coloca la cara en el centro de la imagen para una detección facial precisa. Evita cortar la cabeza o la barbilla; incluye toda la cara en la foto.',
            ),
            _buildConsejo(
              '2. Iluminación:',
              'Utiliza luz natural siempre que sea posible para obtener una iluminación uniforme. Evita la luz directa que pueda crear sombras duras en la cara. Si estás en interiores, colócate frente a una fuente de luz suave.',
            ),
            _buildConsejo(
              '3. Evitar Sombras y Reflejos:',
              'Elimina sombras innecesarias en la cara, ya que pueden afectar la detección. Evita reflejos de superficies brillantes, como espejos, que podrían confundir el análisis.',
            ),
            _buildConsejo(
              '4. Fondo Neutro:',
              'Utiliza un fondo simple y neutro para resaltar la cara. Evita fondos muy ocupados que puedan interferir con la detección.',
            ),
            _buildConsejo(
              '5. Estabilidad de la Cámara:',
              'Sujeta la cámara de manera estable para evitar imágenes borrosas. Si es posible, utiliza un trípode o apóyate en una superficie estable.',
            ),
            _buildConsejo(
              '6. Expresión Facial:',
              'Mantén una expresión facial neutra para obtener una imagen base. Evita expresiones extremas que puedan afectar la interpretación de la imagen.',
            ),
            _buildConsejo(
              '7. Resolución de la Imagen:',
              'Asegúrate de que la imagen tenga una resolución suficiente para detalles finos. Si es posible, utiliza la resolución más alta que te permita tu dispositivo.',
            ),
            _buildConsejo(
              '8. Filtros y Edición Mínima:',
              'Evita aplicar filtros o ediciones excesivas que puedan distorsionar la apariencia real.',
            ),
            _buildConsejo(
              '9. Enfoque:',
              'Asegúrate de que la cámara esté enfocada correctamente en la cara. Evita imágenes borrosas o desenfocadas.',
            ),
            _buildConsejo(
              '10. Ángulo de la Cámara:',
              'Mantén la cámara a la altura de los ojos para obtener una imagen frontal. Evita ángulos extremos que puedan distorsionar la forma del rostro.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConsejo(String titulo, String descripcion) {
    Globals g = Globals();
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: g.lochmara950),
          ),
          SizedBox(height: 8),
          Text(
            descripcion,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}