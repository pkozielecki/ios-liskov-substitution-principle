import Foundation

/// Enum representing the type of payment processor.
///
/// - SeeAlso: PaymentProcessor
public enum PaymentProcessorType: String, Equatable, CaseIterable, Sendable {
    /// Credit card payment processor type.
    case creditCard
    /// Bank transfer payment processor type.
    case bankTransfer
    /// Cryptocurrency payment processor type.
    case crypto
}
