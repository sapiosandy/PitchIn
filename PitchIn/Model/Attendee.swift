//
//  Attendee.swift
//  PitchIn
//
//  Created by Sandra Gomez on 6/29/23.
//

import Foundation

class Attendee {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
