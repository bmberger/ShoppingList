//
//  Unit.swift
//  XcodeProject2_Table_3.0
//
//  Created by Briana Berger on 6/29/18.
//  Copyright © 2018 Briana Berger. All rights reserved.
//

import Foundation

class Unit {
    var tasks : [String] = ["Bread", "Milk"]
    func addTask(name : String) -> [String]
    {
        if(name != "")
        {
            tasks.append(name)
            return tasks
        }
        else {
            return tasks
        }
    }
}
