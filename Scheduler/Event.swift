//
//  Event.swift
//  Scheduler
//
//  Created by Alex Paul on 11/20/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct Event {
  var date: Date
  var name: String
  
  static func getTestData() -> [Event] {
    let eventNames = ["Code", "Unit Assessment", "iOS Soho", "112 mile birthday bike ride", "Ladies night out"]
    var events = [Event]()
    for eventName in eventNames {
      let event = Event(date: Date(), name: eventName)
      events.append(event)
    }
    return events
  }
}
