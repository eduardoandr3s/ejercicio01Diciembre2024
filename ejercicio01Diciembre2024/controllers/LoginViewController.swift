//
//  LoginViewController.swift
//  ejercicio01Diciembre2024
//
//  Created by Eduardo Segovia Román on 05/02/2025.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var lblEmail: UITextField!
    @IBOutlet weak var lblPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btnLogin(_ sender: Any) {
        if let email = lblEmail.text, let password = lblPassword.text{
            Auth.auth().signIn(withEmail: email, password: password){
                (result, error)in
                if let result = result, error == nil{
                    let ventana = self.storyboard?.instantiateViewController(withIdentifier: "INICIO")as!ViewController
                    self.navigationController?.pushViewController(ventana, animated: true)
                    
                }else{
                    let alertController = UIAlertController(title: "ERROR", message: "Usuario y/o contraseña incorrectos.", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "ACEPTAR",style: .default))
                    self.present(alertController, animated: true, completion: nil)
                    
                }
            }
            
        }
    }
    @IBAction func btnRegister(_ sender: Any) {
        if let email = lblEmail.text, let password = lblPassword.text{
            Auth.auth().createUser(withEmail: email, password: password){
                (result, error)in
                if let result = result, error == nil{
                    let ventana = self.storyboard?.instantiateViewController(withIdentifier: "INICIO")as!ViewController
                    self.navigationController?.pushViewController(ventana, animated: true)
                    
                }else{
                    let alertController = UIAlertController(title: "ERROR", message: "Se ha producido un error registrando al usuario.", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "ACEPTAR",style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
            
        }
    }
    }
    

