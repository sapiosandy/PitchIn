//
//  EventRepository.swift
//  PitchIn
//
//  Created by Sandra Gomez on 2/18/26.
//

import Foundation

protocol EventRepository: Sendable {
    func fetchAll() async throws -> [Event]
    func save(_ event: Event) async throws
    func delete(_ event: Event) async throws
    func update(_ event: Event) async throws
    
}
