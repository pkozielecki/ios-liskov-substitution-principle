import Foundation

/// An abstraction checking if cryptocurrency payments are supported in a specific country.
public protocol CryptoSupportChecker: Sendable {
    /// Checks if cryptocurrency payments are supported in the specified country.
    ///
    /// - Parameter country: The country to check for crypto support.
    /// - Returns: `true` if crypto payments are supported in the given country, `false` otherwise.
    func isCryptoSupported(in country: Country) -> Bool
}

/// The default implementation of `CryptoSupportChecker`.
public struct LiveCryptoSupportChecker: CryptoSupportChecker {
    /// The set of countries where cryptocurrency payments are supported.
    private let supportedCountries: Set<Country>

    /// Initializes the checker with a set of supported countries.
    ///
    /// - Parameter supportedCountries: The set of countries where crypto payments are supported.
    ///   Defaults to Poland (`.pl`), Germany (`.de`), and Portugal (`.pt`).
    public init(
        supportedCountries: Set<Country> = [.pl, .de, .pt]
    ) {
        self.supportedCountries = supportedCountries
    }

    /// - SeeAlso: `CryptoSupportChecker.isCryptoSupported(in:)`
    public func isCryptoSupported(in country: Country) -> Bool {
        supportedCountries.contains(country)
    }
}
