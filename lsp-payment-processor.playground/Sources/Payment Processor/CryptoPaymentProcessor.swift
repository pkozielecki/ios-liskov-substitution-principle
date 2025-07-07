import Foundation

/// Processes payments using cryptocurrencies.
public struct CryptoPaymentProcessor: PaymentProcessor {
    /// Service to determine the user's location.
    private let locationService: LocationService
    /// Service to check if crypto is supported in a given country.
    private let cryptoSupportChecker: CryptoSupportChecker

    /// Initializes the processor.
    /// - Parameters:
    ///   - locationService: Provides the user's current country.
    ///   - cryptoSupportChecker: Checks if crypto is supported in a country.
    public init(locationService: LocationService, cryptoSupportChecker: CryptoSupportChecker) {
        self.locationService = locationService
        self.cryptoSupportChecker = cryptoSupportChecker
    }

    /// - SeeAlso: PaymentProcessor.type
    public let type = PaymentProcessorType.crypto

    /// - SeeAlso: PaymentProcessor.processPayment(amount:)
    public func processPayment(amount: Double) async throws -> Bool {
        // Process crypto payment logic
        try await makeCryptoPayment(amount: amount)
        print("Processing $\(amount) via crypto succeeded")
        return true
    }

    /// - SeeAlso: PaymentProcessor.verifyFunds(amount:)
    public func verifyFunds(amount: Double) async throws -> Bool {
        // Check if crypto payments are supported in the user's location
        let country = try await locationService.localizeUserCountry()
        guard cryptoSupportChecker.isCryptoSupported(in: country) else {
            throw PaymentError.cryptoNotSupportedInLocation
        }
        // Check crypto wallet balance
        try await verifyCryptoFunds(amount: amount)
        print("Verifying crypto funds: $\(amount)")
        return true
    }
}

private extension CryptoPaymentProcessor {
    func makeCryptoPayment(amount: Double) async throws {
        try await PaymentProcessorTools.simulateProcessing(
            amount: amount,
            method: type.rawValue,
            minDelay: 1.0,
            maxDelay: 2.0
        )
    }

    func verifyCryptoFunds(amount: Double) async throws {
        try await PaymentProcessorTools.simulateVerification(
            amount: amount,
            method: type.rawValue,
            minDelay: 0.5,
            maxDelay: 1.5
        )
    }
}
