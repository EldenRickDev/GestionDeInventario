//
//  Inventario.swift
//  GestionDeInventario
//
//  Created by Ricardo Andrés Gatica Collarte on 21-08-24.
//

import Foundation

class Inventario {
    var vehiculos: [Vehiculo] = []
    
    func agregarVehiculo(_ vehiculo: Vehiculo) {
        vehiculos.append(vehiculo)
    }
    
    func listarVehiculos() {
        for vehiculo in vehiculos {
            print(vehiculo.detallesDelVehiculo())
        }
    }
    
    func buscarVehiculoPorMarca(_ marca: String) -> Vehiculo? {
        return vehiculos.first { $0.marca == marca }
    }
}

class Vehiculo {
    var marca: String
    var modelo: String
    var año: Int
    
    init(marca: String, modelo: String, año: Int) {
        self.marca = marca
        self.modelo = modelo
        self.año = año
    }
    
    func detallesDelVehiculo() -> String {
        return "Marca: \(marca), Modelo: \(modelo), Año: \(año)"
    }
}

class Auto: Vehiculo {
    var tipoDeCombustible: String
    
    init(marca: String, modelo: String, año: Int, tipoDeCombustible: String) {
        self.tipoDeCombustible = tipoDeCombustible
        super.init(marca: marca, modelo: modelo, año: año)
    }
    
    override func detallesDelVehiculo() -> String {
        return "Marca: \(marca), Modelo: \(modelo), Año: \(año), Tipo de Combustible: \(tipoDeCombustible)"
    }
}

class Motocicleta: Vehiculo {
    var tipoDeManillar: String
    
    init(marca: String, modelo: String, año: Int, tipoDeManillar: String) {
        self.tipoDeManillar = tipoDeManillar
        super.init(marca: marca, modelo: modelo, año: año)
    }
    
    override func detallesDelVehiculo() -> String {
        return "Marca: \(marca), Modelo: \(modelo), Año: \(año), Tipo de Manillar: \(tipoDeManillar)"
    }
}
