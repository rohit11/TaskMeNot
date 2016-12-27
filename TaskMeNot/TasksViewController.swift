//
//  TasksViewController.swift
//  TaskMeNot
//
//  Created by Rohit Nisal on 12/23/16.
//  Copyright © 2016 Rohit Nisal. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource {

   @IBOutlet weak var taskTableView: UITableView!
   @IBOutlet weak var addBarButton: UIBarButtonItem!
   @IBOutlet weak var taskSegementControl: UISegmentedControl!
    
    var numberOfTask = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
      func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfTask
    }
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        
        return cell
    }


    func updateTaskList() {
        UIView.transition(with: self.taskTableView,
                          duration:0.35,
                          options:[.transitionFlipFromTop, .transitionCrossDissolve],
                          animations:
            { () -> Void in
                self.taskTableView.reloadData()
        },
                          completion: nil);
    }
    
    @IBAction func taskValueSelection(_ sender: Any) {
        
        if self.taskSegementControl.selectedSegmentIndex == 0 {
            numberOfTask = 10
        }else {
            numberOfTask = 2
        }
        updateTaskList();
    }
    
}

