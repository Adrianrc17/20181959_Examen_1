// Incluir las librerías necesarias
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Definir una constante para el tamaño del arreglo
#define TAM 15

// Crear una función que devuelva la suma de los divisores propios de un número
int suma_divisores(int n) {
    int suma = 0; // Variable acumuladora
    for (int i = 1; i <= n / 2; i++) { // Bucle desde 1 hasta la mitad del número
        if (n % i == 0) { // Si i es divisor de n
            suma += i; // Sumarlo a la variable acumuladora
        }
    }
    return suma; // Devolver la suma
}

// Crear una función que devuelva la clasificación de un número según la suma de sus divisores
char* clasificar_numero(int n) {
    int suma = suma_divisores(n); // Obtener la suma de los divisores
    if (suma < n) { // Si la suma es menor que el número
        return "Deficiente"; // Devolver "Deficiente"
    } else if (suma == n) { // Si la suma es igual que el número
        return "Perfecto"; // Devolver "Perfecto"
    } else { // Si la suma es mayor que el número
        return "Abundante"; // Devolver "Abundante"
    }
}

// Función principal
int main() {
    int arreglo[TAM]; // Declarar un arreglo de enteros
    srand(time(NULL)); // Inicializar la función rand con la hora actual como semilla
    for (int i = 0; i < TAM; i++) { // Bucle para llenar el arreglo
        arreglo[i] = rand() % 100 + 1; // Generar un número aleatorio entre 1 y 100 y asignarlo al arreglo
    }
    printf("El arreglo es: "); // Imprimir un mensaje
    for (int i = 0; i < TAM; i++) { // Bucle para imprimir el arreglo
        printf("%d ", arreglo[i]); // Imprimir cada elemento del arreglo separado por un espacio
    }
    printf("\n"); // Imprimir un salto de línea
    for (int i = 0; i < TAM; i++) { // Bucle para imprimir la clasificación de cada número
        printf("%d - %s\n", arreglo[i], clasificar_numero(arreglo[i])); // Imprimir el número y su clasificación separados por un guion
    }
    return 0; // Terminar el programa
}
