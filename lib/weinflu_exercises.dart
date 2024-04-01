import 'dart:math';

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
