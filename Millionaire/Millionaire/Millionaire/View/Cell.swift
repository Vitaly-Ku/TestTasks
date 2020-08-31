//
//  Cell.swift
//  Millionaire
//
//  Created by Vit K on 21.08.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
