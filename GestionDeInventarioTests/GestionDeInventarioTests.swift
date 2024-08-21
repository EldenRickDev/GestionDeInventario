//
//  GestionDeInventarioTests.swift
//  GestionDeInventarioTests
//
//  Created by Ricardo Andrés Gatica Collarte on 21-08-24.
//

import XCTest
@testable import GestionDeInventario

final class GestionDeInventarioTests: XCTestCase {

    override func setUpWithError() throws {
        // Configuración antes de cada prueba.
    }

    override func tearDownWithError() throws {
        // Limpieza después de cada prueba.
    }

    // Prueba unitaria para la clase Vehiculo
    func testDetallesDelVehiculo() throws {
        let vehiculo = Vehiculo(marca: "Tesla", modelo: "Model S", año: 2024)
        let detallesEsperados = "Marca: Tesla, Modelo: Model S, Año: 2024"
        XCTAssertEqual(vehiculo.detallesDelVehiculo(), detallesEsperados, "El método detallesDelVehiculo() no devuelve el resultado esperado")
    }

    // Prueba unitaria para la clase Auto (subclase de Vehiculo)
    func testDetallesDelAuto() throws {
        let auto = Auto(marca: "Tesla", modelo: "Model S", año: 2024, tipoDeCombustible: "Eléctrico")
        let detallesEsperados = "Marca: Tesla, Modelo: Model S, Año: 2024, Tipo de Combustible: Eléctrico"
        XCTAssertEqual(auto.detallesDelVehiculo(), detallesEsperados, "El método detallesDelVehiculo() no devuelve el resultado esperado para Auto")
    }

    // Prueba unitaria para la clase Motocicleta (subclase de Vehiculo)
    func testDetallesDeMotocicleta() throws {
        let moto = Motocicleta(marca: "Harley-Davidson", modelo: "Sportster", año: 2022, tipoDeManillar: "Chopper")
        let detallesEsperados = "Marca: Harley-Davidson, Modelo: Sportster, Año: 2022, Tipo de Manillar: Chopper"
        XCTAssertEqual(moto.detallesDelVehiculo(), detallesEsperados, "El método detallesDelVehiculo() no devuelve el resultado esperado para Motocicleta")
    }

    // Prueba unitaria para la clase Inventario
    func testAgregarYListarVehiculosEnInventario() throws {
        let inventario = Inventario()
        let auto = Auto(marca: "Tesla", modelo: "Model S", año: 2024, tipoDeCombustible: "Eléctrico")
        let moto = Motocicleta(marca: "Harley-Davidson", modelo: "Sportster", año: 2022, tipoDeManillar: "Chopper")
        
        inventario.agregarVehiculo(auto)
        inventario.agregarVehiculo(moto)
        
        // Verifica que ambos vehículos se agregaron correctamente
        XCTAssertEqual(inventario.vehiculos.count, 2, "El inventario no tiene el número correcto de vehículos")
        
        // Verifica que los detalles de los vehículos agregados son correctos
        XCTAssertEqual(inventario.vehiculos[0].detallesDelVehiculo(), "Marca: Tesla, Modelo: Model S, Año: 2024, Tipo de Combustible: Eléctrico")
        XCTAssertEqual(inventario.vehiculos[1].detallesDelVehiculo(), "Marca: Harley-Davidson, Modelo: Sportster, Año: 2022, Tipo de Manillar: Chopper")
    }

    // Prueba unitaria para buscar un vehículo por marca en el Inventario
    func testBuscarVehiculoPorMarca() throws {
        let inventario = Inventario()
        let auto = Auto(marca: "Tesla", modelo: "Model S", año: 2024, tipoDeCombustible: "Eléctrico")
        let moto = Motocicleta(marca: "Harley-Davidson", modelo: "Sportster", año: 2022, tipoDeManillar: "Chopper")
        
        inventario.agregarVehiculo(auto)
        inventario.agregarVehiculo(moto)
        
        // Busca un vehículo existente
        let vehiculoEncontrado = inventario.buscarVehiculoPorMarca("Tesla")
        XCTAssertNotNil(vehiculoEncontrado, "No se encontró el vehículo por marca, pero debería existir")
        XCTAssertEqual(vehiculoEncontrado?.detallesDelVehiculo(), "Marca: Tesla, Modelo: Model S, Año: 2024, Tipo de Combustible: Eléctrico")
        
        // Intenta buscar un vehículo que no existe
        let vehiculoNoEncontrado = inventario.buscarVehiculoPorMarca("Ford")
        XCTAssertNil(vehiculoNoEncontrado, "Se encontró un vehículo que no debería existir en el inventario")
    }
}
