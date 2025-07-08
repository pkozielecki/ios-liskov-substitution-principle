import Foundation

/// A payment processor for handling next gen cryptocurrency transactions.
public final class NextGenCryptoPaymentsProcessor: PaymentProcessor, Sendable {
    /// Service for checking if cryptocurrency is supported in a specific country.
    private let cryptoSupportChecker: CryptoSupportChecker

    /// Service for localizing the user, used to determine their current country.
    private let locationService: LocationService

    /// Actor for safely caching the user's country in concurrent contexts.
    private let countryCache = CountryCache()

    /// Initializes the processor.
    ///
    /// - Parameters:
    ///   - locationService: Service providing the user's current country.
    ///   - cryptoSupportChecker: Service to check if crypto payments are supported in a country.
    public init(
        locationService: LocationService,
        cryptoSupportChecker: CryptoSupportChecker
    ) {
        self.cryptoSupportChecker = cryptoSupportChecker
        self.locationService = locationService
        Task {
            let country = try await locationService.localizeUserCountry()
            await countryCache.set(country)
            print("Initialized NextGenCryptoPaymentsProcessor with country: \(country.rawValue)")
        }
    }

    /// - SeeAlso: `PaymentProcessor.type`
    public let type = PaymentProcessorType.nextGenCrypto

    /// - SeeAlso: `PaymentProcessor.processPayment(amount:)`
    public func processPayment(amount: Double) async throws -> Bool {
        try await makeCryptoPayment(amount: amount)
        print("Processing $\(amount) via next gen crypto")
        return true
    }

    /// - SeeAlso: `PaymentProcessor.verifyFunds(amount:)`
    public func verifyFunds(amount: Double) async throws -> Bool {
        var country = await countryCache.get()
        if country == nil {
            let localized = try await locationService.localizeUserCountry()
            await countryCache.set(localized)
            country = localized
        }
        print("Verifying crypto funds: $\(amount) (country: \(country.orOther.rawValue))")
        guard cryptoSupportChecker.isCryptoSupported(in: country.orOther) else {
            throw PaymentError.cryptoNotSupportedInLocation
        }
        try await verifyCryptoFunds(amount: amount)
        return true
    }
}

private extension NextGenCryptoPaymentsProcessor {
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
