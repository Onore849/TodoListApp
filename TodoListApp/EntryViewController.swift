//
//  EntryViewController.swift
//  TodoListApp
//
//  Created by 野澤拓己 on 2020/08/23.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var field: UITextField!
    
    var update: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveTask()
        
        return true
    }
    
    @objc func saveTask() {
        
        guard let text = field.text, !text.isEmpty else {
            
            return
            
        }
        
        guard let count = UserDefaults.standard.value(forKey: "count") as? Int else {
            
            return
            
        }
        
        let newCount = count + 1
        
        UserDefaults.standard.set(newCount, forKey: "count")
        
        UserDefaults.standard.set(text, forKey: "task_\(newCount)")
        
        update?()
        
        navigationController?.popViewController(animated: true)
        
        
    }
    

}
