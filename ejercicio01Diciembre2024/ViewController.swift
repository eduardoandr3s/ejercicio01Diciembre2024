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
    
    var examenes: [Examen] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtIndice.keyboardType = .numberPad
        txtPreguntasAcertadas.keyboardType = .numberPad
        txtPreguntasTotales.keyboardType = .numberPad
        // Do any additional setup after loading the view.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacement String: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: String)
        return allowedCharacters.isSuperset(of: characterSet)
        
    }
    
    func alertError(titulo: String, mensaje: String){
        let alert = UIAlertController( title: titulo, message:
                                        mensaje, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnInsertarExamen(_ sender: Any) {
        
        let nombre = txtNombre.text!
        let totalP = txtPreguntasTotales.text!
        let totalA = txtPreguntasAcertadas.text!
        if nombre.isEmpty || totalP.isEmpty || totalA.isEmpty {
            alertError(titulo: "ERROR", mensaje: "Faltan datos para crear el examen")
        }else{
            examenes.append(Examen(nombre: nombre, totalPreguntas:
                                    Int(totalP)!, totalAcertadas: Int (totalA)!))
            alertError(titulo: "Perfecto!!", mensaje: "Examen de \(nombre)")
            
            txtNombre.text = ""
            txtPreguntasTotales.text = ""
            txtPreguntasAcertadas.text = ""
        }
    }
    @IBAction func btnVerExamen(_ sender: Any) {
        let indice = txtIndice.text!
        if indice.isEmpty{
            alertError(titulo: "ERROR", mensaje: "No tengo nada que buscar")
        }else{
            if Int(indice)! < 1 || Int(indice)! > examenes.count{
                alertError(titulo: "ERROR", mensaje: "El examen no existe")
            }else{
                lblNotaFinal.text = examenes[Int(indice)! -
                                                1].toString()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indice = txtIndice.text!;
        if(segue.identifier=="MOSTRAR"){
            let examenAEnviar = examenes[Int(indice)! - 1];
            
            let nuevaVentana = segue.destination as! SecondViewController;
            
            nuevaVentana.examenRecibido = examenAEnviar;
         
            
        }
        
    }
    
}

