//
//  ResultsVC.swift
//  Millionaire
//
//  Created by Vit K on 21.08.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.layer.cornerRadius = 7
        table.delegate = self
        table.dataSource = self
    }
}

extension ResultsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Game.shared.statistics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        
        let record = Game.shared.statistics[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        
        cell.recordLabel.text = "\(record.score)"
        cell.dateLabel.text = dateFormatter.string(from: record.date)
        
        return cell
    }
}
