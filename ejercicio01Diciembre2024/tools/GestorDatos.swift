//
//  GestorDatos.swift
//  ejercicio01Diciembre2024
//
//  Created by Eduardo Segovia Román on 24/01/2025.
//

import UIKit

class GestorDatos: NSObject {
    func guardar(dato: [Examen], clave: String){
        let datoCodificado = try? JSONEncoder().encode(dato);
        
        UserDefaults.standard.setValue(datoCodificado, forKey: clave);
        UserDefaults.standard.synchronize();
        
    
    }
   
    
    func leer(clave: String) -> [Examen] {
        
        guard let datoCodificado = UserDefaults.standard.value(forKey: clave) as? Data
      else{
        return []
      }
        
        let datoDecodificado:[Examen] = try! JSONDecoder().decode([Examen].self, from: datoCodificado);
        return datoDecodificado;
    }
    
    
    func vaciar(clave: String){
        UserDefaults.standard.removeObject(forKey: clave);
        UserDefaults.standard.synchronize();
    }
}
