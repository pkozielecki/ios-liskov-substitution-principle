import Foundation

/// Processes payments using credit cards.
public struct CreditCardProcessor: PaymentProcessor {
    public init() {}

    /// - SeeAlso: PaymentProcessor.type
    public let type = PaymentProcessorType.creditCard

    /// - SeeAlso: PaymentProcessor.processPayment(amount:)
    public func processPayment(amount: Double) async throws -> Bool {
        //  Process payment logic:
        try await makeCreditCardPayment(amount: amount)

        print("Processing $\(amount) via credit card succeeded")
        return true
    }

    /// - SeeAlso: PaymentProcessor.verifyFunds(amount:)
    public func verifyFunds(amount: Double) async throws -> Bool {
        //  Verify credit limit:
        try await verifyCreditCardPayment(amount: amount)

        print("Verifying credit card funds: $\(amount)")
        return true
    }
}

private extension CreditCardProcessor {
    func makeCreditCardPayment(amount: Double) async throws {
        try await PaymentProcessorTools.simulateProcessing(
            amount: amount,
            method: type.rawValue,
            minDelay: 1.5,
            maxDelay: 2.5
        )
    }

    func verifyCreditCardPayment(amount: Double) async throws {
        try await PaymentProcessorTools.simulateVerification(
            amount: amount,
            method: type.rawValue,
            minDelay: 0.8,
            maxDelay: 2.3
        )
    }
}
