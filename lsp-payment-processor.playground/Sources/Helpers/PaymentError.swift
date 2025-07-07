import Foundation

/// Errors that can occur during payment processing.
public enum PaymentError: Error {
    /// Indicates that the requested payment processor could not be found.
    case processorNotFound
    /// Indicates that crypto payments are not supported in the user's location.
    case cryptoNotSupportedInLocation
}
