//
//  ViewController.swift
//  XcodeProject2_Table_3.0
//
//  Created by Briana Berger on 6/29/18.
//  Copyright © 2018 Briana Berger. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask, ChangeButton {

    var tasks: [Task] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tasks.append(Task(name: "Strawberries"))
        tasks.append(Task(name: "Bananas"))
        tasks.append(Task(name: "Lettuce"))
        tasks.append(Task(name: "Whole Wheat Bread"))
        tasks.append(Task(name: "Milk"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //lets it know what we want to edit
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        //type cast it to be a TaskCell
        
        //sets label to whatever it is in tasks array
        cell.taskNameLabel.text = tasks[indexPath.row].name
        
        //if true
        if tasks[indexPath.row].checked {
            cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "checkBoxFILLED"), for: UIControlState.normal)
        }
        else {
            cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "checkBoxOUTLINE "), for: UIControlState.normal)
        }
        
        cell.delegate = self
        cell.indexP = indexPath.row
        cell.tasks = tasks
        
        return cell
    }
    
    //allows us to have addtask edit this viewcontroller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddTaskController
        vc.delegate = self
    }
    
    func addTask(name: String) {
        tasks.append(Task(name: name))
        tableView.reloadData()
    }
    
    func changeButton(checked: Bool, index: Int) {
        tasks[index].checked = checked
        tableView.reloadData()
    }

}

class Task {
    var name = ""
    var checked = false
    convenience init(name: String){
        self.init()
        self.name = name;
    }
}

