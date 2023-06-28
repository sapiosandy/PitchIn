//
//  Item.swift
//  PitchIn
//
//  Created by Sandra Gomez on 6/28/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
