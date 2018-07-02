//
//  ViewController.swift
//  XcodeProject2_Table_3.0
//
//  Created by Briana Berger on 6/29/18.
//  Copyright © 2018 Briana Berger. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask, ChangeButton {

    //creates the tasks array with type of object Task (as defined at bottom of code)
    var tasks: [Task] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        //adds some standard values to table
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
        
        //changes the image of button check marker if checked or unchecked
        if tasks[indexPath.row].checked {
            cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "checkBoxFILLED"), for: UIControlState.normal)
        }
        else {
            cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "checkBoxOUTLINE "), for: UIControlState.normal)
        }
        
        //setting the cell's values
        //has the cell's delegate be to this ViewController class
        cell.delegate = self
        
        //has the cell's indexP to be the current indexPath's row (aka the next spot available to enter data)
        cell.indexP = indexPath.row
        
        //has the cell's tasks table be set equal to the task's value, so then both can access the tasks array.
        cell.tasks = tasks
        
        //returns the updates cell
        return cell
    }
    
    //allows us to have addtask edit this viewcontroller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddTaskController
        vc.delegate = self
    }
    
    //the delegate in AddTaskController uses this command to edit this view and the tasks data table.
    func addTask(name: String) {
        tasks.append(Task(name: name))
        tableView.reloadData()
    }
    
    //the delegate in TaskCell uses this command to edit this view and the tasks data table.
    func changeButton(checked: Bool, index: Int) {
        tasks[index].checked = checked
        tableView.reloadData()
    }

}

//defines the generated/standard values of the task cell
class Task {
    var name = ""
    var checked = false
    convenience init(name: String){
        self.init()
        self.name = name;
    }
}

