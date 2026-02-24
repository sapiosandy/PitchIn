//
//  LocalEventRepositoryTests.swift
//  PitchInTests
//
//  Created by Sandra Gomez on 2/23/26.
//

import Testing
import Foundation
@testable import PitchIn

struct LocalEventRepositoryTests {
    private func makeSUT() -> LocalEventRepository {
        let defaults = UserDefaults(suiteName: "test_suite")!
        defaults.removePersistentDomain(forName: "test_suite")
        return LocalEventRepository(defaults: defaults)
    }

    @Test func fetchAll_whenEmpty_returnsEmptyArray() async throws {
        let sut = makeSUT()
        let events = try await sut.fetchAll()
        #expect(events.isEmpty)
    }

    @Test func save_thenFetchAll_returnsEvent() async throws {
        let sut = makeSUT()
        let event = Event(
            id: UUID(),
            title: "BBQ",
            date: .now,
            location: "Backyard",
            items: []
        )
        try await sut.save(event)
        let fetched = try await sut.fetchAll()
        #expect(fetched.count == 1)
        #expect(fetched.first?.title == "BBQ")
    }

    @Test func delete_removesCorrectEvent() async throws {
        let sut = makeSUT()
        let event = Event(
            id: UUID(),
            title: "Party",
            date: .now,
            location: "Park",
            items: []
        )
        try await sut.save(event)
        try await sut.delete(event)
        let fetched = try await sut.fetchAll()
        #expect(fetched.isEmpty)
    }

    @Test func update_modifiesExistingEvent() async throws {
        let sut = makeSUT()
        var event = Event(
            id: UUID(),
            title: "Potluck",
            date: .now,
            location: "Office",
            items: []
        )
        try await sut.save(event)
        event.title = "Updated Potluck"
        try await sut.update(event)
        let fetched = try await sut.fetchAll()
        #expect(fetched.first?.title == "Updated Potluck")
    }
}
