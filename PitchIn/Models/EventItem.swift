//
//  EventItem.swift
//  PitchIn
//
//  Created by Sandra Gomez on 2/18/26.
//
import Foundation

struct EventItem: Identifiable, Codable, Sendable {
    let id: UUID
    var title: String
    var isClaimed: Bool
    var claimedBy: String?
}
