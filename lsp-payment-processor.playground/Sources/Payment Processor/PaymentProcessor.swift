import Foundation

/// An abstraction that defines a payment processor capable of handling and verifying payments.
public protocol PaymentProcessor: Sendable {
    /// The type of payment processor.
    var type: PaymentProcessorType { get }
    
    /// Processes a payment of the specified amount asynchronously.
    /// - Parameter amount: The amount to process.
    /// - Returns: `true` if the payment was successful, otherwise `false`.
    /// - Throws: An error if the payment could not be processed.
    ///
    /// - SeeAlso: PaymentProcessor.processPayment(amount:)
    func processPayment(amount: Double) async throws -> Bool

    /// Verifies if sufficient funds are available for the specified amount asynchronously.
    /// - Parameter amount: The amount to verify.
    /// - Returns: `true` if funds are sufficient, otherwise `false`.
    /// - Throws: An error if the funds could not be verified.
    ///
    /// - SeeAlso: PaymentProcessor.verifyFunds(amount:)
    func verifyFunds(amount: Double) async throws -> Bool
}
