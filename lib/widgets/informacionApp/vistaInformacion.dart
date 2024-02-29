import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesis/globals.dart';

class InformacionWidget extends StatefulWidget{
  @override
  _InformacionWudgetState createState() => _InformacionWudgetState();
}

class _InformacionWudgetState extends State<InformacionWidget>{
  List valores = [false,false,false,false,false,false];

  @override
  Widget build(BuildContext context) {
    Globals g = Globals();
    return Scaffold(
        appBar: AppBar(
          title: Text("Enfermedades posibles"),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: ExpansionPanelList(
              elevation: 1,
              expandedHeaderPadding: EdgeInsets.all(0),
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  print(index);
                  print(isExpanded);
                  valores[index]= !isExpanded;
                });
              },
              children: [
                ExpansionPanel(headerBuilder: (context, isExpanded){
                  return ListTile(
                    contentPadding: EdgeInsets.all(10),
                    title: Text("ACNE",style: TextStyle(color: g.lochmara950,fontSize: 20),),
                  );
                }, body: Container(
                  padding: EdgeInsets.only(left: 30,right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Image.asset("assets/acne.jpg", height: 200),),
                      SizedBox(height: 10,),
                      Text("Es una afección cutánea que causa la formación de granos o 'barros'. Pueden aparecer comedones cerrados, espinillas negras y parches rojos e inflamados de la piel (como quistes).  ",
                          style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10,),
                      Text("Causas:",style: TextStyle(color: g.lochmara950,fontSize: 20),),
                      SizedBox(height: 10,),
                      Text("El acné se presenta cuando se taponan los orificios diminutos en la superficie de la piel. Estos orificios se llaman poros.",
                          style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10,),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 8,height: 8, margin: EdgeInsets.only(left: 5,right: 15),decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),),
                          Expanded(child: Text("Cada poro es una abertura a un folículo, el cual contiene un cabello y una glándula sebácea. El aceite secretado por la glándula ayuda a eliminar las células cutáneas viejas y mantiene la piel suave.",
                            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 8,height: 8, margin: EdgeInsets.only(left: 5,right: 15),decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),),
                          Expanded(child: Text("Cuando las glándulas producen demasiado aceite, los poros pueden resultar obstruidos. Se acumula suciedad, bacterias y células inflamatorias. La obstrucción se denomina tapón o comedón. Si la parte superior del tapón es blanca, se denomina acné miliar. Si la parte superior del tapón es oscura, se denomina espinilla negra.",
                            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 8,height: 8, margin: EdgeInsets.only(left: 5,right: 15),decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),),
                          Expanded(child: Text("Si las bacterias quedan atrapadas en los poros, el sistema inmunológico del cuerpo reacciona, provocando espinillas.",
                            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 8,height: 8, margin: EdgeInsets.only(left: 5,right: 15),decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),),
                          Expanded(child: Text("El acné que está profundo en la piel puede causar quistes firmes y dolorosos. A esto se le denomina acné noduloquístico.",
                            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
                    isExpanded: valores[0]),
                ExpansionPanel(headerBuilder: (context, isExpanded){
                  return ListTile(
                    contentPadding: EdgeInsets.all(10),
                    title: Text("Dermatitis atópica (eccema)".toUpperCase(),style: TextStyle(color: g.lochmara950,fontSize: 20),),
                  );
                }, body: Container(
                  padding: EdgeInsets.only(left: 30,right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Image.asset("assets/eczema.jpg", height: 200),),
                      SizedBox(height: 10,),
                      Text("El eczema es una afección cutánea que puede afectar tanto a niños como a adultos. En concreto, se trata de una reacción inflamatoria: la piel reacciona de forma exagerada a su entorno, está muy seca y se cubre de ronchas rojas, vesículas, a veces supurantes, y, sobre todo, desencadena un deseo incontrolable de rascarse hasta el punto de crear sensaciones de quemazón o incluso hinchazón local, ya que la piel pica mucho.",
                        style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10,),
                      Text("Causas:",style: TextStyle(color: g.lochmara950,fontSize: 20),),
                      SizedBox(height: 10,),
                      Text("En algunas personas, la dermatitis atópica está relacionada con una variación genética que afecta la capacidad de la piel de ofrecer protección.",
                        style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 8,height: 8, margin: EdgeInsets.only(left: 5,right: 15),decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),),
                          Expanded(child: Text("Con una capacidad de protección más débil, la piel no es capaz de retener la humedad y brindar protección contra bacterias, irritantes, alérgenos y factores medioambientales, como el humo del tabaco.",
                            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 8,height: 8, margin: EdgeInsets.only(left: 5,right: 15),decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),),
                          Expanded(child: Text("En otras personas, la dermatitis atópica aparece a raíz de la proliferación de la bacteria Staphylococcus aureus en la piel. Su presencia reemplaza a las bacterias útiles e interrumpe la función protectora de la piel.",
                            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 8,height: 8, margin: EdgeInsets.only(left: 5,right: 15),decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),),
                          Expanded(child: Text("Además, una capacidad de protección débil desencadena una respuesta del sistema inmunitario que provoca la inflamación de la piel, entre otros síntomas.",
                            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 8,height: 8, margin: EdgeInsets.only(left: 5,right: 15),decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),),
                          Expanded(child: Text("La dermatitis atópica (eczema) es uno de los diversos tipos de dermatitis. Entre los otros tipos de dermatitis se encuentran la dermatitis por contacto y la dermatitis seborreica (caspa). La dermatitis no es contagiosa.",
                            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
                    isExpanded: valores[1]),

                ExpansionPanel(headerBuilder: (context, isExpanded){
                  return ListTile(
                    contentPadding: EdgeInsets.all(10),
                    title: Text("pigmentacion".toUpperCase(),style: TextStyle(color: g.lochmara950,fontSize: 20),),
                  );
                }, body: Container(
                  padding: EdgeInsets.only(left: 30,right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Image.asset("assets/pigmentacion.jpg", height: 200),),
                      SizedBox(height: 10,),
                      Text("Afección común, por lo general benigna, por la que aparecen manchas de piel más oscura que la piel que la rodea. Se presenta cuando células especiales de la piel producen demasiada cantidad del pigmento llamado melanina. La hiperpigmentación aparece como pecas, manchas de la edad o áreas más grandes de piel más oscura. Las causas de hiperpigmentación son lesiones, inflamaciones de la piel, daño por la luz del sol, bultos anormales en la piel, cambios hormonales, embarazo y otras afecciones. Ciertos medicamentos, como algunos de los que se usan para tratar el cáncer, también producen hiperpigmentación.",
                        style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10,),
                      Text("Causas:",style: TextStyle(color: g.lochmara950,fontSize: 20),),
                      SizedBox(height: 10,),
                      Text("La hiperpigmentación se origina por un aumento de la producción de melanina. La melanina es el pigmento natural que da su color a la piel, el cabello y los ojos. El aumento en la producción de la melanina se puede deber a varios factores, pero los principales son la exposición al sol, los cambios hormonales, la edad y lesiones o inflamación de la piel. ",
                        style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 8,height: 8, margin: EdgeInsets.only(left: 5,right: 15),decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),),
                          Expanded(child: Text("La exposición al sol es la causa número uno de la hiperpigmentación, ya que es la radiación solar la que activa, en primera instancia, la producción de melanina. ",
                            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 8,height: 8, margin: EdgeInsets.only(left: 5,right: 15),decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),),
                          Expanded(child: Text("Los cambios hormonales son una de la causas principales  de un tipo concreto de hiperpigmentación conocido como melasma o cloasma. Es frecuente en especial en mujeres y se cree que se produce cuando las hormonas sexuales femeninas (el estrógeno y la progesterona) estimulan la sobreproducción de melanina cuando la piel se expone al sol.",
                            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 8,height: 8, margin: EdgeInsets.only(left: 5,right: 15),decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),),
                          Expanded(child: Text("A medida que la piel envejece, el número de células que producen melanina (conocidas como melanocitos) disminuye, pero las restantes aumentan de tamaño y su distribución se concentra. Estos cambios fisiológicos explican el aumento de las manchas relacionadas con la edad en las personas mayores de 40 años.",
                            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 8,height: 8, margin: EdgeInsets.only(left: 5,right: 15),decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),),
                          Expanded(child: Text("se produce después de lesiones o inflamaciones cutáneas como cortes, quemaduras, exposición a sustancias químicas, acné, dermatitis atópica o psoriasis. Cuando cicatriza la herida, la piel se vuelve oscura y se hiperpigmenta.",
                            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
                    isExpanded: valores[2]),
                ExpansionPanel(headerBuilder: (context, isExpanded){
                  return ListTile(
                    contentPadding: EdgeInsets.all(10),
                    title: Text("Lunares benignos".toUpperCase(),style: TextStyle(color: g.lochmara950,fontSize: 20),),
                  );
                }, body: Container(
                  padding: EdgeInsets.only(left: 30,right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Image.asset("assets/benigno.jpg", height: 200),),
                      SizedBox(height: 10,),
                      Text("Por lo general, los lunares normales son de color uniforme, como tostado, marrón o negro, y tienen un borde nítido que separa el lunar de la piel que lo rodea. Son ovalados o redondos y, a menudo, tienen menos de un cuarto de pulgada (alrededor de 6 milímetros) de diámetro, el tamaño de una goma de lápiz.",
                        style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10,),
                      Text("Causas:",style: TextStyle(color: g.lochmara950,fontSize: 20),),
                      SizedBox(height: 10,),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 8,height: 8, margin: EdgeInsets.only(left: 5,right: 15),decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),),
                          Expanded(child: Text("La mayoría de los lunares comienzan a aparecer en la infancia y pueden formarse nuevos lunares hasta aproximadamente los 40 años.",
                            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 8,height: 8, margin: EdgeInsets.only(left: 5,right: 15),decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),),
                          Expanded(child: Text("En la edad adulta, la mayoría de las personas tienen entre 10 y 40 lunares.",
                            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 8,height: 8, margin: EdgeInsets.only(left: 5,right: 15),decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),),
                          Expanded(child: Text("Los lunares pueden cambiar de aspecto con el tiempo y algunos pueden incluso desaparecer con la edad.",
                            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
                    isExpanded: valores[3]),

                ExpansionPanel(headerBuilder: (context, isExpanded){
                  return ListTile(
                    contentPadding: EdgeInsets.all(10),
                    title: Text("Melanoma maligno".toUpperCase(),style: TextStyle(color: g.lochmara950,fontSize: 20),),
                  );
                }, body: Container(
                  padding: EdgeInsets.only(left: 30,right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Image.asset("assets/maligno.jpg", height: 200),),
                      SizedBox(height: 10,),
                      Text("El melanoma es un cáncer que se origina en los melanocitos. A este cáncer se le conoce también como  melanoma maligno y melanoma cutáneo. La mayoría de las células del melanoma continúan produciendo melanina de modo que los tumores tipo melanoma usualmente son de color café o negro. Sin embargo, algunos melanomas no producen melanina y pueden lucir de color rosado, pálido o incluso blanco.",
                        style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10,),
                      Text("Causas:",style: TextStyle(color: g.lochmara950,fontSize: 20),),
                      SizedBox(height: 10,),
                      Text("El melanoma ocurre cuando hay algún problema con las células productoras de melanina (melanocitos) que dan color a la piel.",
                        style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 8,height: 8, margin: EdgeInsets.only(left: 5,right: 15),decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),),
                          Expanded(child: Text("Normalmente, las células de la piel se desarrollan de una manera controlada y ordenada; las nuevas células sanas empujan las células más antiguas hacia la superficie de la piel, donde mueren y finalmente se caen.",
                            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 8,height: 8, margin: EdgeInsets.only(left: 5,right: 15),decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),),
                          Expanded(child: Text("Pero cuando algunas células desarrollan daños del ADN, las células nuevas pueden comenzar a crecer fuera de control y con el tiempo pueden formar un tumor de células cancerosas.",
                            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 8,height: 8, margin: EdgeInsets.only(left: 5,right: 15),decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),),
                          Expanded(child: Text("Lo que daña el ADN en las células de la piel y cómo esto produce un melanoma no está claro. Es probable que una combinación de factores, entre ellos factores ambientales y genéticos, produzca el melanoma.",
                            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 8,height: 8, margin: EdgeInsets.only(left: 5,right: 15),decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),),
                          Expanded(child: Text("los médicos creen que la exposición a la radiación ultravioleta del sol y de las lámparas y camas de bronceado es la principal causa del melanoma.",
                            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 8,height: 8, margin: EdgeInsets.only(left: 5,right: 15),decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),),
                          Expanded(child: Text("La luz ultravioleta no provoca todos los melanomas, especialmente aquellos que se producen en lugares del cuerpo que no reciben exposición a la luz solar. Esto indica que otros factores pueden intervenir en el riesgo de padecer melanoma.",
                            style: TextStyle(fontSize: 15), textAlign: TextAlign.justify,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
                    isExpanded: valores[4]),
              ],
            ),
          ),
        )
    );
  }
}