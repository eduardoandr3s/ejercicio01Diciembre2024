//
//  Examen.swift
//  ejercicio01Diciembre2024
//
//  Created by Eduardo Segovia Roman on 12/12/24.
//

import Foundation
class Examen: Codable{
    var nombre: String
    var totalPreguntas: Int
    var totalAcertadas: Int
    var notaFinal: Float
    init(nombre: String, totalPreguntas: Int, totalAcertadas: Int) {
        self.nombre = nombre
        self.totalPreguntas = totalPreguntas
        self.totalAcertadas = totalAcertadas
        self.notaFinal = Float(totalAcertadas) * 10 /
            Float(totalPreguntas)
    }
    
    func convertDictionary() -> [String: Any]{
        return [
            "nombre": nombre,
            "totalPreguntas" : totalPreguntas,
            "totalAcertadas": totalAcertadas,
            "notaFinal": notaFinal
        ]
    }
    
    
    func toString() -> String{
        return "Nombre: \(nombre) \nTotal Preguntas: \(totalPreguntas)\nTotalAcertadas: \(totalAcertadas)\nNota Final:\(notaFinal)"
    }
}
