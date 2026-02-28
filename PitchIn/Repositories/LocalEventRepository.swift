//
//  LocalEventRepository.swift
//  PitchIn
//
//  Created by Sandra Gomez on 2/18/26.
//

import Foundation

class LocalEventRepository: EventRepository {

    private let defaults: UserDefaults
    private let key = "pitchin_events"
    
    init (defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    func fetchAll() async throws -> [Event] {
        guard let data = defaults.data(forKey: key) else { return [] }
        return try JSONDecoder().decode([Event].self, from: data)
    }
    func save(_ event: Event) async throws {
        var events = try await fetchAll()
        events.append(event)
        try persist(events)
    }
    func delete(_ event: Event) async throws {
        var events = try await fetchAll()
        events.removeAll { $0.id == event.id }
        try persist(events)
    }
    func update(_ event: Event) async throws {
        var events = try await fetchAll()
        guard let index = events.firstIndex(where: { $0.id == event.id })
        else {
            throw RepositoryError.eventNotFound
        }
        events[index] = event
        try persist(events)
    }
    
    private func persist(_ events: [Event]) throws {
        let data = try JSONEncoder().encode(events)
        defaults.set(data, forKey: key)
    }
}

enum RepositoryError: Error, LocalizedError {
    case eventNotFound
    
    var errorDescription: String? {
        switch self {
        case .eventNotFound:
            "The event could not be found."
        }
    }
}
