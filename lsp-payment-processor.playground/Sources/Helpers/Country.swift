import Foundation

/// Represents the supported countries for crypto payments.
///
/// Use the `Country` enum to specify or check which countries are supported
/// for cryptocurrency transactions. Each case corresponds to a specific country,
/// identified by its ISO 3166-1 alpha-2 country code. The `.other` case can be used
/// for countries not explicitly listed.
///
/// Extend this enum by adding more cases as additional countries become supported.
public enum Country: String, Equatable, CaseIterable, Sendable {
    /// United States
    case us = "US"
    /// Poland
    case pl = "PL"
    /// Germany
    case de = "DE"
    /// France
    case fr = "FR"
    /// United Kingdom
    case gb = "GB"
    /// Portugal
    case pt = "PT"
    /// Morocco
    case ma = "MA"
    /// Other or unspecified country
    case other = "OTHER"
    // Add more countries as needed
}

public extension Optional where Wrapped == Country {
    /// Returns the unwrapped country or `.other` if nil.
    var orOther: Country {
        self ?? .other
    }
}
