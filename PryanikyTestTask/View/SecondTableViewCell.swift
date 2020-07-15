//
//  SecondTableViewCell.swift
//  PryanikyTestTask
//
//  Created by Vit K on 14.07.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit
import AlamofireImage

class SecondTableViewCell: UITableViewCell {
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func configureCell(data: DataClass) {
        label.text = data.text
        guard let urlUserImage = data.url else { return }
        picture.af.setImage(withURL: (URL(string: urlUserImage) ?? URL(string: ""))!)
    }
}
