//
//  SecondViewController.swift
//  ejercicio01Diciembre2024
//
//  Created by Eduardo Segovia Román on 13/01/2025.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblMostarDatosSecond: UILabel!
    var examenRecibido:Examen?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblMostarDatosSecond.text = examenRecibido?.toString();
        // Do any additional setup after loading the view.
    }
    


}
