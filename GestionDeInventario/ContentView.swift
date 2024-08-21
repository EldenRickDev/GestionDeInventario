//
//  ContentView.swift
//  GestionDeInventario
//
//  Created by Ricardo Andrés Gatica Collarte on 21-08-24.
//

import SwiftUI

struct ContentView: View {
    let inventario: Inventario

    // Inicializador para configurar el inventario
    init() {
        inventario = Inventario()

        let miAuto = Auto(marca: "Tesla", modelo: "Model S", año: 2024, tipoDeCombustible: "Eléctrico")
        let miMoto = Motocicleta(marca: "Harley-Davidson", modelo: "Sportster", año: 2022, tipoDeManillar: "Chopper")

        // Agregar vehículos al inventario
        inventario.agregarVehiculo(miAuto)
        inventario.agregarVehiculo(miMoto)
    }

    var body: some View {
        // Definimos colores personalizados para usar en la interfaz
        let primaryColor = Color.blue
        let secondaryColor = Color.gray

        VStack(alignment: .leading, spacing: 15) {
            // Añadimos un icono antes del texto "Lista de Vehículos" para mejorar la apariencia
            HStack {
                Image(systemName: "car.fill")
                    .foregroundColor(.green)
                Text("Lista de Vehículos:")
                    .font(.title2)
                    .foregroundColor(.gray)
            }

            // Usamos colores personalizados para el título y subtítulo
            Text("Sistema de Gestión de Inventario")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(primaryColor)
                .padding()

            Text("Lista de Vehículos:")
                .font(.title2)
                .foregroundColor(secondaryColor)
                .padding(.bottom, 10)

            // Usamos ForEach para listar los detalles de cada vehículo con una animación simple
            ForEach(inventario.vehiculos, id: \.marca) { vehiculo in
                // Animamos la aparición de cada vehículo
                withAnimation {
                    Text(vehiculo.detallesDelVehiculo())
                        .font(.body)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.bottom, 5)
                }
            }

            // Añadimos un botón para interactuar, por ejemplo, para agregar más vehículos
            Button(action: {
                // Aquí podrías añadir la lógica para agregar un nuevo vehículo
                print("Botón presionado: Agregar Vehículo")
            }) {
                Text("Agregar Vehículo")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(primaryColor)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(.top, 20) // Añadimos espacio antes del botón
        }
        .padding() // Añadimos padding al VStack principal
    }
}

// Estructura para la previsualización
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

