import Foundation

/// An actor for safely caching a user's country in concurrent contexts.
public actor CountryCache {
    /// The cached country value, if available.
    private var country: Country?

    /// Creates a new, empty country cache.
    public init() {}

    /// Sets the cached country to a new value.
    ///
    /// - Parameter newCountry: The country to cache.
    public func set(_ newCountry: Country) {
        self.country = newCountry
    }

    /// Retrieves the currently cached country, if any.
    ///
    /// - Returns: The cached `Country`, or `nil` if none is set.
    public func get() -> Country? {
        country
    }
}
