//
//  CeldaTableViewCell.swift
//  ejercicio01Diciembre2024
//
//  Created by Eduardo Segovia Román on 20/01/2025.
//

import UIKit

class CeldaTableViewCell: UITableViewCell {
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblPreguntas: UILabel!
    @IBOutlet weak var lblAcertadas: UILabel!
    @IBOutlet weak var lblNota: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Confige the view for the selected state
    }

}
