//
//  ViewController.swift
//  ejercicio01Diciembre2024
//
//  Created by Eduardo Segovia Roman on 12/12/24.
//

import UIKit
import Toast

class ViewController: UIViewController {
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtPreguntasTotales: UITextField!
    @IBOutlet weak var txtPreguntasAcertadas: UITextField!
    @IBOutlet weak var txtIndice: UITextField!
    @IBOutlet weak var lblNotaFinal: UILabel!
    
    var listaExamenes:[Examen] = [];
        var indice = 0;
        var nota = 0.0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnInsertarExamen(_ sender: Any) {
        nota = Double((Float(txtPreguntasAcertadas.text!)!)/(Float(txtPreguntasTotales.text!)!)*10)
                
                let nuevoExamen: Examen = Examen(nombre: txtNombre.text!, preguntasTotales: Int(txtPreguntasTotales.text!)!, acertadas: Int(txtPreguntasAcertadas.text!)!, notaFinal: Float(nota));
                listaExamenes.append(nuevoExamen);
        self.view.makeToast("Examen de \(nuevoExamen.nombre) agregado.")
        
    }
    @IBAction func btnVerExamen(_ sender: Any) {
        indice = Int(txtIndice.text!)!;
                
                lblNotaFinal.text = "Alumno: \(listaExamenes[indice].nombre), \n\n Preguntas totales: \(listaExamenes[indice].preguntasTotales), \n\n Acertadas: \(listaExamenes[indice].acertadas). \n \n NOTA FINAL: \(listaExamenes[indice].notaFinal)"
    }
    
}

