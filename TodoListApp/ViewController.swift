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
        if !UserDefaults.standard.bool(forKey: "setup") {
            
            UserDefaults.standard.set(true, forKey: "setup")
            UserDefaults.standard.set(0, forKey: "count")
            
        }
        
        
        // Get all current saved tasks
        updateTasks()
        
    }
    
    func updateTasks() {
        
        tasks.removeAll()
        
        guard let count = UserDefaults.standard.value(forKey: "count") as? Int else {
            
            return
            
        }
        
        for i in 0..<count {
            
            if let task = UserDefaults.standard.value(forKey: "task_\(i+1)") as? String {
                
                tasks.append(task)
                
            }
            
        }
        
        tableView.reloadData()
        
    }
    
    
    @IBAction func didtapAdd() {
        
        // 遷移させる
        let vc = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        
        vc.title = "New task"
        vc.update = {
            
            DispatchQueue.main.async {
                
                self.updateTasks()
                
            }
        }
        
        navigationController?.pushViewController(vc, animated: true)
        
    }


}



extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Rowの選択を解除できる
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        // 遷移させる
        let vc = storyboard?.instantiateViewController(withIdentifier: "task") as! TasksViewController
        
        vc.title = "New task"
        vc.task = tasks[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
        
        
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


