import Foundation

public protocol PaymentProcessor: Sendable {
    var type: PaymentProcessorType { get }
    func processPayment(amount: Double) async throws -> Bool
    func verifyFunds(amount: Double) async throws -> Bool
}
