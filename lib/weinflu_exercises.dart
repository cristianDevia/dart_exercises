import 'dart:math';
import 'dart:io';
import 'dart:convert';

void exercise1() {
  /** 
   * A partir del siguiente arreglo de edades var ages = [33, 15, 27, 40, 22,19,32,76,45];
   * Crea un programa en Dart que las ordene e imprima la edad mayor, la edad menor y la edad promedio 
   * con sus respectivos mensajes: “La edad mayor es: ” , “La edad menor es: ”, “La edad promedio es: ”
   */

  var ages = [33, 15, 27, 40, 22, 19, 32, 76, 45];
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
  var usdList = [20000, 30000, 4000, 2500, 1000, 7600];
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
