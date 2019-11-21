//
//  ViewController.swift
//  Scheduler
//
//  Created by Alex Paul on 11/20/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ScheduleListController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  // data - an array of events
  var events = [Event]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    events = Event.getTestData()
    tableView.dataSource = self
  }
  
  @IBAction func addNewEvent(segue: UIStoryboardSegue) {
    // caveman debugging
    
    // get a reference to the CreateEventController instance
    guard let createEventController = segue.source as? CreateEventController,
      let createdEvent = createEventController.event else {
        fatalError("failed to access CreateEventController")
    }
    
    // insert new event into our events array
    events.insert(createdEvent, at: 0) // top of the events array
    
    // create an indexPath to be inserted into the table view
    let indexPath = IndexPath(row: 0, section: 0) // will represent top of table view
    
    // use indexPath to insert into table view
    tableView.insertRows(at: [indexPath], with: .automatic)
  }
}

extension ScheduleListController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return events.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
    let event = events[indexPath.row]
    cell.textLabel?.text = event.name
    cell.detailTextLabel?.text = event.date.description
    return cell
  }
  
  // MARK:- deleting rows in a table view
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    switch editingStyle {
    case .insert:
      print("inserting....")
    case .delete:
      print("deleting..")
      events.remove(at: indexPath.row) // remove event from events array
      tableView.deleteRows(at: [indexPath], with: .automatic)
    default:
      print("......")
    }
  }
}

