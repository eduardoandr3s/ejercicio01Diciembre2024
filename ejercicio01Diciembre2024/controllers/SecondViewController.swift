//
//  SecondViewController.swift
//  ejercicio01Diciembre2024
//
//  Created by Eduardo Segovia Román on 13/01/2025.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblNombreSecond: UILabel!
    @IBOutlet weak var lblPreguntasSecond: UILabel!
    @IBOutlet weak var lblAcertadasSecond: UILabel!
    @IBOutlet weak var lblNotaSecond: UILabel!
    
    var examenRecibido:Examen?;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTitulo.text = "Examen de \(examenRecibido!.nombre)";
        
        lblNombreSecond.text = "Nombre: \(examenRecibido!.nombre)"
        lblPreguntasSecond.text = "Preguntas: \(examenRecibido!.totalPreguntas)"
        lblAcertadasSecond.text = "Acertadas: \(examenRecibido!.totalAcertadas)"
        lblNotaSecond.text = "Nota: \(examenRecibido!.notaFinal)"

        // Do any additional setup after loading the view.
    }
    


}
