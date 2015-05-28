//
//  AulaTableViewCell.swift
//  UsersAula
//
//  Created by MIguel Saravia on 5/25/15.
//  Copyright (c) 2015 Xiobit. All rights reserved.
//

import UIKit

class AulaTableViewCell: UITableViewCell {
  
  @IBOutlet weak var NombreTableViewCell: UILabel!
  @IBOutlet weak var ApellidoTableViewCell: UILabel!
  @IBOutlet weak var MateriaTableViewCell: UILabel!
  @IBOutlet weak var GestionTableViewCell: UILabel!
  @IBOutlet weak var CursoTableViewCell: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
