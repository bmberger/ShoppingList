//
//  AddTaskController.swift
//  XcodeProject2_Table_3.0
//
//  Created by Briana Berger on 6/29/18.
//  Copyright © 2018 Briana Berger. All rights reserved.
//

import UIKit
protocol AddTask {
    func addTask(name: String)
}
class AddTaskController: UIViewController {

    
    @IBAction func addAction(_ sender: Any) {
        if taskNameOutlet.text != "" {
            delegate?.addTask(name: taskNameOutlet.text!)
            taskNameOutlet.text = ""
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    @IBOutlet weak var taskNameOutlet: UITextField!
    
    var delegate: AddTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}
