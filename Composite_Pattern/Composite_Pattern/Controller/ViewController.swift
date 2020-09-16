//
//  ViewController.swift
//  Composite_Pattern
//
//  Created by Vit K on 16.09.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var task : Task = Task(name: "task", subtasks: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "+", style: .done, target: self, action: #selector(self.action(sender:)))
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.layer.cornerRadius = 15
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    @objc func action(sender: UIBarButtonItem) {
        task.addSubtask(task: Task(name: "задача \(task.subtasks.count + 1)", subtasks: []))
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier : "ViewController") as! ViewController
        vc.task = task.subtasks[indexPath.row]
        self.navigationController!.pushViewController(vc, animated : true)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { 1 }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        task.subtasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TasksCell
        cell.taskLabel?.text = task.subtasks[indexPath.row].description()
        cell.layer.cornerRadius = 10
        return cell
    }
}
