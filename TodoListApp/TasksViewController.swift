//
//  TasksViewController.swift
//  TodoListApp
//
//  Created by 野澤拓己 on 2020/08/23.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var task: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
        
    }
    
    @objc func deleteTask() {
        
//        let newCount = count - 1
//        let currentPostion =
//
//        UserDefaults().setValue(newCount, forKey: "count")
//        UserDefaults().setValue(nil, forKey: "task_\(currentPosition)")
        
    }
    
    

}
