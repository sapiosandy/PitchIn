//
//  TestHelpers.swift
//  PitchInTests
//
//  Created by Sandra Gomez on 3/2/26.
//

import Foundation
@testable import PitchIn

func makeSUT() -> LocalEventRepository {
    let defaults = UserDefaults(suiteName: "test_suite")!
    defaults.removePersistentDomain(forName: "test_suite")
    return LocalEventRepository(defaults: defaults)
}
