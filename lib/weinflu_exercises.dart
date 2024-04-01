import 'dart:math';
import 'dart:io';
import 'dart:convert';

void exercise1() {
  /** 
   * A partir del siguiente arreglo de edades var ages = [33, 15, 27, 40, 22,19,32,76,45];
   * Crea un programa en Dart que las ordene e imprima la edad mayor, la edad menor y la edad promedio 
   * con sus respectivos mensajes: “La edad mayor es: ” , “La edad menor es: ”, “La edad promedio es: ”
   */

  List<int> ages = [33, 15, 27, 40, 22, 19, 32, 76, 45];
  print("La edad mayor es: ${ages.reduce(max)}");
  print("La edad menor es: ${ages.reduce(min)}");
  print(
      "La edad promedio es: ${ages.reduce((current, next) => current + next) / ages.length}");
}

void exercise2() {
  /**
   * Dada la siguiente lista de ingresos en dólares: listaDolares = [20000,30000,4000,2500,1000,7600]
   * Se le pide hacer un programa que muestre lo siguiente:
   * 1. Tener una variable que cuando valga C para muestre la lista en pesos colombianos (se
   * sabe que un dólar es **4,773** pesos colombianos aproximadamente) D en dólares 
   * notifique que no es necesaria una conversión pues ya estaba en dólares y E para
   * convertir en euros (se sabe que un dólar es 0.92 euros aproximadamente). En caso
   * de que la variable ingrese una letra diferente notifíquele que es una entrada no válida y regrese al menú principal.
   * 2. Se sabe que los dependiendo de los ingresos mensuales se divide de la siguiente manera:
   * • Menor a 1000 dólares de ingreso mensuales ingresos bajos
   * • Mayor a 1000 pero menor a 7000 dólares mensuales ingresos medios
   * • Desde 7000 pero menores a 20000 dólares mensuales ingresos altos
   * • Desde 20000 en adelante ingresos elevados
   * Muestre una lista con esta clasificación
   * 3. Muestre la siguiente información:
   * • Ingreso más alto
   * • Ingreso más bajo
   * • Promedio de ingresos
   * 4. Despedirse Si la persona ingresa cualquier otro número se debe notificar al usuario que la entrada no es válida
   */

  const int copExchange = 4773;
  const double eurExchange = 0.92;
  List<int> usdList = [20000, 30000, 4000, 2500, 1000, 7600];
  const acceptableValues = ["C", "D", "E"];
  bool correctLetter = false;
  bool acceptedIncome = false;

  while (!correctLetter) {
    print("Ingrese una Letra.");
    var line = stdin.readLineSync(encoding: utf8);
    var lineValue = line?.trim();

    if (acceptableValues.contains(lineValue?.toUpperCase())) {
      correctLetter = true;
      switch (lineValue?.toUpperCase()) {
        case "C":
          var copList = [];
          for (var i = 0; i < usdList.length; i++) {
            var currency = usdList[i];
            copList.add(currency * copExchange);
          }
          print("lista en pesos colombianos $copList");
          break;
        case "D":
          print(
              "No es necesaria una conversión pues la lista ya estaba en dólares");
          break;
        case "E":
          var eurList = [];
          for (var i = 0; i < usdList.length; i++) {
            var currency = usdList[i];
            eurList.add(currency * eurExchange);
          }
          print("lista en euros $eurList");
          break;
        default:
          break;
      }
    } else {
      print("Debe ser entre C y E");
    }
  }

  while (!acceptedIncome) {
    print("Cuales son sus ingresos (en usd) ?");
    var line = stdin.readLineSync(encoding: utf8);
    var lineValue = line?.trim();
    int usdIncomeValue = 0;

    try {
      usdIncomeValue = lineValue != null ? int.parse(lineValue) : 0;

      if (usdIncomeValue < 0) {
        print("Por favor ingrese un numero positivo");
      } else {
        acceptedIncome = true;
        if (usdIncomeValue <= 1000) {
          print("Sus ingresos mensuales son bajos");
        } else if (usdIncomeValue > 1000 && usdIncomeValue <= 70000) {
          print("Sus ingresos mensuales son medios");
        } else if (usdIncomeValue > 7000 && usdIncomeValue <= 20000) {
          print("Sus ingresos mensuales son medios");
        } else {
          print("Sus ingresos son altos");
        }

        print("Ingreso mas alto: ${usdList.reduce(max)}");
        print("Ingreso mas bajo: ${usdList.reduce(min)}");
        print(
            "Ingreso promedio: ${usdList.reduce((current, next) => current + next) / usdList.length}");
      }
    } catch (e) {
      print("Debe ingresar un numero");
    }
  }
}

void exercise3() {
  /**
   * Dada una lista de Nombres, mostrar en pantalla la cantidad de letras y si esa cantidad es par o impar
   */
  List<String> names = ["Cristian", "Daniel", "Sandra", "Paola"];
  for (var name in names) {
    String actualName = name;
    int nameLength = actualName.length;
    print(
        "Nombre: $actualName - Cantidad de letras: $nameLength - ${nameLength % 2 == 0 ? "par" : "impar"} ");
  }
}

abstract class Person {
  final String id;
  final String name;
  final int age;

  Person(this.id, this.name, this.age);

  void speak(String pMessage) {
    print(pMessage);
  }

  void walk(int pSteps) {
    if (pSteps > 1) {
      print("He dado $pSteps pasos");
    } else if (pSteps == 1) {
      print("He dado $pSteps paso");
    }
  }
}

class Doctor extends Person {
  final String specialty;

  Doctor(super.id, super.name, super.age, this.specialty);

  void disease(String pDisease) {
    print("Procedo a tratar su enfermedad de $pDisease");
  }
}

class Nutritionist extends Person {
  final String university;

  Nutritionist(super.id, super.name, super.age, this.university);

  String bodyMassIndex(double pMass, double pBody) {
    return ((pMass) / pow(pBody, 2)).toStringAsFixed(2);
  }
}

class Lawyer extends Person {
  final String university;
  final String specialty;

  Lawyer(super.id, super.name, super.age, this.university, this.specialty);

  void work(String pName, String pCase) {
    print("procedo a representar al cliente $pName en el caso $pCase");
  }
}

void exercise4() {
  /**
   * Cree las siguientes clases y un objeto a partir de las misma que ejecute todas las acciones incluidas las de su padre:
   * 1. Cree la clase Persona con id, nombre, edad y cree la función hablar la cual dado mensaje
   * se muestra en pantalla y cree la clase caminar que dado una cantidad de pasos muestra en
   * pantalla cuanto ha caminado (por ejemplo si se ingresa 3 mostrará en pantalla he dado 1 paso, 2 pasos, 3 pasos).
   * 2. Herede la clase Persona y cree la clase Doctor el cual tendrá el nuevo atributo de
   * especialidad y podrá ejecutar una nueva función, la cual es dado una enfermedad muestre en pantalla: procedo a tratar dicha enfermedad
   * 3. Herede la clase Persona y cree la clase Nutricionista y cree un atributo que se refiera a la
   * universidad en la que fue egresado. También una función que devuelva el IMC dado el peso y altura de un paciente
   * 4. Herede la clase Persona y cree la clase Abogado adicione dos atributos uno asociado a su especialidad y el otro a la universidad de la que egresó. 
   * Finalmente cree la función que dado un nombre y el caso de cliente el abogado diga : procedo a representar al cliente {nombre} en el caso {caso}
   */

  var newDoctor = Doctor("123", "Cristian", 26, "Cardiologo");
  newDoctor.speak("Hola, soy el doctor Cristian");
  newDoctor.disease("hipertension");
  print(
      "--------------------------------------------------------------------------------------");

  var newNutritionist = Nutritionist("456", "Daniel", 30, "Cambridge");
  newNutritionist.speak(
      "Hola, soy el nutricionista Daniel, necesito su estatura en metros y su peso en KG");
  var bodyMassIndex = newNutritionist.bodyMassIndex(47, 1.65);
  print("Su indice de masa corporal es: $bodyMassIndex");
  print(
      "--------------------------------------------------------------------------------------");

  var newLawyer = Lawyer("789", "Paola", 25, "Harvard", "Derecho de familia");
  newLawyer.speak("Hola, mi nombre es Paola y soy abogada de familia");
  newLawyer.work("Luis", "Divorcio");
  print(
      "--------------------------------------------------------------------------------------");
}
