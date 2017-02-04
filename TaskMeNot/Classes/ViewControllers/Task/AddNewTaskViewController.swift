//
//  AddNewTaskViewController.swift
//  TaskMeNot
//
//  Created by Rohit Nisal on 12/23/16.
//  Copyright © 2016 Rohit Nisal. All rights reserved.
//

import UIKit

class AddNewTaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var showTaskDatePicker = false
    var showTaskTimePicker = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNewTask(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelTask(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskName", for: indexPath)
            //set the data here
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskDate", for: indexPath)
            //set the data here
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectDatePicker", for: indexPath)
            //set the data here
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskDate", for: indexPath)
            //set the data here
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectDatePicker", for: indexPath)
            //set the data here
            return cell
        }

        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        switch indexPath.row {
        case 1:
            if self.showTaskDatePicker{
                self.showTaskDatePicker = false
            } else {
                self.showTaskDatePicker = true
            }
            let indexPath = IndexPath(item: 2, section: 0)
            tableView.reloadRows(at: [indexPath], with: .fade)
            
            break
        case 3:
            if self.showTaskTimePicker{
                self.showTaskTimePicker = false
            } else {
                self.showTaskTimePicker = true
            }
            let indexPath = IndexPath(item: 4, section: 0)
            tableView.reloadRows(at: [indexPath], with: .fade)
            break
        default:
            break
            
        }
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
            
        case 2 :
            if showTaskDatePicker {
                return 204
            } else{
                return 0
            }
        case 4 :
            if showTaskTimePicker {
                return 204
            } else{
                return 0
            }
        default :
            return 44
        }
    }
}

