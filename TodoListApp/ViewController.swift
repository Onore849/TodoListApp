//
//  ViewController.swift
//  TodoListApp
//
//  Created by 野澤拓己 on 2020/08/23.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var tasks = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tasks"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // setup
        if !UserDefaults.bool(forKey: "setup") {
            
            
            
            
        }
        
        
        // Get all current saved tasks
        
    }
    
    
    @IBAction func didtapAdd() {
        
        // 遷移させる
        let vc = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        
        vc.title = "New task"
        navigationController?.pushViewController(vc, animated: true)
        
    }


}



extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Rowの選択を解除できる
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }

    
}


