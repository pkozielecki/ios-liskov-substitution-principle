import Foundation

/// An abstraction defining a service capable of making payments using a specified processor type.
public protocol PaymentService: Sendable {
    /// Makes a payment of the specified amount using the given payment processor type.
    /// - Parameters:
    ///   - amount: The amount to pay.
    ///   - processorType: The type of payment processor to use.
    /// - Returns: `true` if the payment was successful, otherwise `false`.
    /// - Throws: An error if the payment could not be completed.
    func makePayment(amount: Double, processorType: PaymentProcessorType) async throws -> Bool
}
