//
//  MainViewController.swift
//  PryanikyTestTask
//
//  Created by Vit K on 14.07.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var response: Data?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        NetService.loadData { [weak self] result in
            switch result {
            case .success(let response):
                self?.response = response
                self!.tableView.reloadData()
            case .failure(let error):
                print("error: ", error)
            }
        }
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return response?.view.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            cell.configureCell(data: (response?.data[indexPath.row].data)!)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! ThirdTableViewCell
            let f1 = response?.data[2].data.variants![0].text
            let f2 = response?.data[2].data.variants![1].text
            let f3 = response?.data[2].data.variants![2].text
            cell.segment.setTitle(f1, forSegmentAt: 0)
            cell.segment.setTitle(f2, forSegmentAt: 1)
            cell.segment.setTitle(f3, forSegmentAt: 2)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! SecondTableViewCell
            cell.configureCell(data: (response?.data[1].data)!)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
           cell.configureCell(data: (response?.data[0].data)!)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            cell.label.text = "default"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showCellNameAlert(i: response?.view[indexPath.row] ?? "default")
    }
    
    func showCellNameAlert(i: String) {
        let alert = UIAlertController(title: nil, message: i, preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

