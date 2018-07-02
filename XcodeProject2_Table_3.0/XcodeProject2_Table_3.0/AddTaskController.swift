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
            //send data via the delegate to ViewController's addTask function to edit view controller's view and table data.
            delegate?.addTask(name: taskNameOutlet.text!)
            
            //reset the input field to empty for user efficiency
            taskNameOutlet.text = ""
            
            //goes to main screen
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    @IBOutlet weak var taskNameOutlet: UITextField!
    
    //creates the AddTask delegate (used to access ViewController)
    var delegate: AddTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}
