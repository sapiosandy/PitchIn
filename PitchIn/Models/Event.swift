//
//  Event.swift
//  PitchIn
//
//  Created by Sandra Gomez on 2/18/26.
//

import Foundation

struct Event: Identifiable, Codable, Sendable {
    let id: UUID
    var title: String
    var date: Date
    var location: String
    var items: [EventItem] = []
    
    
    init(id: UUID = UUID(), title: String, date: Date, location: String, items: [EventItem] = []) {
        self.id = id
        self.title = title
        self.date = date
        self.location = location
        self.items = items
    }
}
