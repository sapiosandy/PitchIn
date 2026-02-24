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
    var items: [EventItem]
    
}
