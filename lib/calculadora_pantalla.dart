import 'package:calculadora/fuentes.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CalculatorScreen> {
  String numer1 = "";
  String operand = ""; // + - / x
  String numer2 = "";

//////OPERACIONES////////////
///botones de numeros
  Widget botonesNum(String text){
    return 
    Expanded(
      child: InkWell(   
        onTap: () => onBtnTap(text),

        child: Container(
          height: 82,
          alignment: Alignment.center,
         
             child: fuenteNormal(26, text, const Color.fromARGB(255, 255, 255, 255))
             
        )));}

///Botones superiores
  Widget botonesSup(double anchoBotom,String name, Color color){
  return 
    Padding(
      padding: const EdgeInsets.only(left: 5, right: 3, top: 10, bottom: 10),     
      child: InkWell(
        onTap: () => onBtnTap(name),
      
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 16, 16, 16),
            borderRadius: BorderRadius.circular(5)
          ),
          width: anchoBotom,
          height: 35,
          
          child: 
          Padding(
            padding: const EdgeInsets.all(6),
            child: fuenteNormal(16, name, color),
          )      
        ),
      ),
    );
  }




  void onBtnTap(String dato){
    if(dato == "⌫"){
      delete();
      return;
    }
    if(dato == "Borrar todo"){
      clearAll();
      return;
    }
    if(dato == "%"){
      convertirPorcenraje();
      return;
    }

    if(dato == "="){
      calcular();
      return;
    }
    appendValue(dato);}

    //Calculo
    void calcular(){
      if(numer1.isEmpty) return;
      if(operand.isEmpty) return;
      if(numer2.isEmpty) return;

      double num1 = double.parse(numer1);
      double num2 = double.parse(numer2);

      var result = 0.0;
      switch(operand){
        case "+":
        result = num1 + num2;
        break;
        case "-":
        result = num1 - num2;
        break;
        case "x":
        result = num1 * num2;
        break;
        case "÷":
        result = num1 / num2;
        break;
        default:
      }

      setState(() {
        numer1 = "$result";
        if(numer1.endsWith(".0")){
          numer1 = numer1.substring(0, numer1.length -2);
        }

        operand = "";
        numer2 = "";
      });
      
    }

    //Porcentaje
    void convertirPorcenraje(){
      if(numer1.isNotEmpty&&operand.isNotEmpty&&numer2.isNotEmpty){
        
      }
      if(operand.isNotEmpty){
        return;
      }
      final numero = double.parse(numer1);
      setState(() {
        numer1 = "${(numero / 100 )}";
        operand = "";
        numer2 = "";
      });
    }

    //Eliminar todo
    void clearAll(){
      setState(() {
        numer1 = "";
        operand = "";
        numer2 = "";
      });
    }

    //Eliminar uno
    void delete(){
      if(numer2.isNotEmpty){
        numer2 = numer2.substring(0, numer2.length - 1);
      }else if(operand.isNotEmpty){
        operand = "";
      }else if(numer1.isNotEmpty){
        numer1 = numer1.substring(0, numer1.length -1);
      }
      setState(() {
        
      });
    }    


    void appendValue(dato){
      if(dato != "." && int.tryParse(dato) == null){
      //
      if(operand.isNotEmpty && numer2.isNotEmpty){
      }
      operand = dato;
    }else if(numer1.isEmpty || operand.isEmpty){
      //
      if(dato == "." && numer1.contains("."))return;
      if(dato == "." && (numer1.isEmpty|| numer1 == "0")){
        //
        dato = "0.";
      }
      numer1 += dato;
    }else if(numer2.isEmpty || operand.isNotEmpty ){
      //
      if(dato == "." && numer2.contains("."))return;
      if(dato == "." && (numer2.isEmpty|| numer2 == "0")){
        //
        dato = "0.";
      }
      numer2 += dato;
    }

    setState(() {
       });
    }

      
////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 6, 6),
      body: Column(
        children: [
          //salida

          //Pantalla G
            Padding(
              padding: const EdgeInsets.only( right: 35, top: 40),
              child: Container(
                height: 130,
               alignment: Alignment.bottomRight,
                child: 
                fuentePantalla(110, "$numer1$operand$numer2".isEmpty
                ? ""
                : "$numer1",
                const Color.fromARGB(255, 255, 255, 255)

                
                
                )        
              ),
            ),
            Padding(
             padding: const EdgeInsets.only(top: 5,right: 35, bottom: 30),
              child: Container(  
                height: 40,
               alignment: Alignment.bottomRight,
                child: 
                fuentePantalla(33, "$numer1$operand$numer2".isEmpty
                ? "0"
                : "$numer1$operand$numer2",
                const Color.fromARGB(255, 125, 125, 125)),
                
              ),
            ),

            Container(
              
              alignment: Alignment.bottomRight,
              child:              
              Padding(
                padding: const EdgeInsets.only(left: 25 ,right: 25),
                child: Container(
                  child: Row(
                    children: [
                      botonesSup(115,"Borrar todo", const Color.fromARGB(255, 255, 57, 57)),
                      botonesSup(40, "⌫", const Color.fromARGB(255, 77, 77, 77)),
                 
                      botonesSup(32, "%", const Color.fromARGB(255, 77, 77, 77)),
                      botonesSup(32, "÷", const Color.fromARGB(255, 77, 77, 77))
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              
              child: Container( 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25 ,bottom: 40, top: 10),
                      child: Container(
                        child: Row(
                          children: [

                            //Container numeros
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                height: 350,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: 
                                  [
                                    const Color(0xFF101010),
                                    const Color(0xFF101010),
                                    const Color(0xFF101010),
                                    const Color(0xFF101010),
                                    const Color(0xFF101010),
                                    const Color(0xFF101010),
                                  const Color.fromARGB(255, 12, 12, 12)                           
                                  ],
                                
                                 
                                  transform: GradientRotation(7.8)
                                  ),
                                 
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                width: 250,
                              
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        botonesNum("7"),
                                        botonesNum("8"),
                                        botonesNum("9"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        botonesNum("4"),
                                        botonesNum("5"),
                                        botonesNum("6"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        botonesNum("1"),
                                        botonesNum("2"),
                                        botonesNum("3"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        botonesNum(""),
                                        botonesNum("0"),
                                        botonesNum("."),
                                      ],
                                    ),
                                  ],
                                ),
                              ),                        
                              ),
                            ),
                            


                            //Container signos
                            
                                Container(
                               
                                  width: 80,
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    children: [
                                      botonesNum("x"),
                                      botonesNum("-"),
                                      botonesNum("+"),

                                      Container(
                                        
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 16, 16, 16),
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        
                                        child: botonesNum("="),
                                      ),
                                      
                                    ],
                                  ),
                                ),
                                ),                                                              
                          ],

                        ),

                        
                          
                        
                      ),
                    ),
                  ],
                ),
              ),
              




            )
          
        ],


      ),
    );


    


  }
  
}