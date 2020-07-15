//
//  TableViewCell.swift
//  PryanikyTestTask
//
//  Created by Vit K on 14.07.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
        
    @IBOutlet weak var label: UILabel!
    
    func configureCell(data: DataClass) {
        label.text = data.text
    }
}
