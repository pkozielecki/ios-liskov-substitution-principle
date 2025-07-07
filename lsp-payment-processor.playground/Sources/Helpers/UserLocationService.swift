import Foundation

/// An abstraction for providing the user's geographic location.
public protocol LocationService: Sendable {
    /// Asynchronously determines the user's current country.
    ///
    /// - Returns: The user's current `Country`.
    /// - Throws: An error if localization fails.
    func localizeUserCountry() async throws -> Country
}

/// A default implementation of `LocationService`.
public struct LiveLocationService: LocationService, Sendable {

    /// Creates a new instance of `LiveLocationService`.
    public init() {}

    /// - SeeAlso: `LocationService.localizeUserCountry()`
    public func localizeUserCountry() async throws -> Country {
        // Simulate a network/location delay using PaymentProcessorTools
        try await PaymentProcessorTools.simulateVerification(
            amount: 0,
            method: "location",
            minDelay: 0.3,
            maxDelay: 1.0
        )
        return Country.allCases.randomElement() ?? .pl
    }
}
