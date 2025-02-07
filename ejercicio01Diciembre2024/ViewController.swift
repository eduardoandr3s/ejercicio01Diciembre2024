//
//  ViewController.swift
//  ejercicio01Diciembre2024
//
//  Created by Eduardo Segovia Roman on 12/12/24.
//

import UIKit
import Toast
import FirebaseAuth
import FirebaseFirestore

        class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtPreguntasTotales: UITextField!
    @IBOutlet weak var txtPreguntasAcertadas: UITextField!
    
    
    @IBOutlet weak var tabla: UITableView!
    
    var examenes: [Examen]!;
    var examen: Examen!;
   // var gestorDatos: GestorDatos!;
            
            var dataBase: Firestore!;
            var identifier:String!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        examenes = [];
        tabla.delegate = self;
        tabla.dataSource = self;
        
        txtPreguntasAcertadas.keyboardType = .numberPad
        txtPreguntasTotales.keyboardType = .numberPad
        // Do any additional setup after loading the view.
       // gestorDatos = GestorDatos();
        
        
          //  examenes = gestorDatos.leer(clave: "LISTA");
            tabla.reloadData();
        let user = Auth.auth().currentUser;
        dataBase = Firestore.firestore();
        identifier = user?.email;
        loadExamUsers();
        
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
            let listaCambiada = examenes.map{$0.convertDictionary()}
            
           
            
            dataBase.collection("usuarios").document(identifier).setData(["examenes": listaCambiada]) {error in
                if let error = error {print("Error insertando")}
                else{
                    print("Insertado con éxito el examen")
                }
            }
            
            
            
            
            
            alertError(titulo: "Perfecto!!", mensaje: "Examen de \(nombre) agregado con éxito!!")
            
          //  gestorDatos.guardar(dato: examenes, clave: "LISTA")
            tabla.reloadData();
            
            txtNombre.text = ""
            txtPreguntasTotales.text = ""
            txtPreguntasAcertadas.text = ""
        }
    }
    @IBAction func btnVaciarRegistro(_ sender: Any) {
        
   //     gestorDatos.vaciar(clave: "LISTA")
        dataBase.collection("usuarios").document(identifier).delete();
        examenes = [];
        tabla.reloadData();

    }
            func loadExamUsers(){
                dataBase.collection("usuarios").document(identifier).getDocument{(document, error) in if let error = error{
                    print("Error leyendo desde la Database")
                    return
                }
                guard let document = document, document.exists, let data = document.data() else{
                    
                        print("Tu Database esta vacía!")
                    return;
                    
                }
                
                if let lista = data["examenes"] as? [[String : Any]]{
                    self.examenes = lista.map{dict in return Examen(
                        nombre: dict["nombre"] as? String ?? "", totalPreguntas: dict["totalPreguntas"] as? Int ?? 0, totalAcertadas: dict["totalAcertadas"] as? Int ?? 0
                    )}
                    
                    DispatchQueue.main.async {
                        self.tabla.reloadData();
                    }
                }
                
                }
            }
            
            @IBAction func logout(_ sender: Any) {
                do{
                    try Auth.auth().signOut()
                    self.navigationController?.popViewController(animated: true)
                    
                }catch{
                    //Error
                }
            }
            
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="MOSTRAR"){
           
            
            let nuevaVentana = segue.destination as! SecondViewController;
            
            let indiceExamen = tabla.indexPathForSelectedRow!.row;
            
            let examenSeleccionado = examenes[indiceExamen];
            
            nuevaVentana.examenRecibido = examenSeleccionado;
         
            
        }
        return
    }
            
            
    
    
    //CONSEGUIR LA REFERENCIA A LA NUEVA VENTANA
   // let nuevaVentana = segue.destination as! MostarDatos;
    
    
    //QUE ELEMENTO DE LA LISTA HA SIDO SELECCIONADO
    //let indiceTarea = tablaTareas.indexPathForSelectedRow!.row;
   
    //ENCONTRAR LA TAREA EN EL ARRAY
    //let tareaSeleccionada = listaTareas[indiceTarea];
    
    //EN LA NUEVA VENTANA PASARLE LA TAREA
   // nuevaVentana.tarea = tareaSeleccionada;
    
    // TABLA VIEW
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        examenes.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "CELDA", for: indexPath) as! CeldaTableViewCell;
        examen = examenes[indexPath.row];
        celda.lblNombre.text = examen.nombre;
        celda.lblPreguntas.text = String(examen.totalPreguntas);
        celda.lblAcertadas.text = String(examen.totalAcertadas);
        celda.lblNota.text = String(examen.notaFinal);
        
        return celda;
        
    }
    
    
}

