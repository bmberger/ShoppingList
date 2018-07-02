//
//  TaskCellTableViewCell.swift
//  XcodeProject2_Table_3.0
//
//  Created by Briana Berger on 6/29/18.
//  Copyright © 2018 Briana Berger. All rights reserved.
//

import UIKit
protocol ChangeButton {
    func changeButton(checked: Bool, index: Int)
}
class TaskCell: UITableViewCell {
    
    //accesses ViewController via delegate and changes button based on being checked or unchecked
    @IBAction func checkBoxAction(_ sender: Any) {
        if tasks![indexP!].checked {
            delegate?.changeButton(checked: false, index: indexP!)
        }
        else {
            delegate?.changeButton(checked: true, index: indexP!)
        }
    }
    @IBOutlet weak var checkBoxOutlet: UIButton!
    @IBOutlet weak var taskNameLabel: UILabel!
    
    //sets the delegate to ChangeButton (used to access ViewController)
    var delegate: ChangeButton?
    
    //has the delegate's indexP to be the current cell indexPath's row (aka the next spot available to enter data)
    var indexP: Int?
    
    //sets tasks to an array of Task objects
    var tasks: [Task]?

}
