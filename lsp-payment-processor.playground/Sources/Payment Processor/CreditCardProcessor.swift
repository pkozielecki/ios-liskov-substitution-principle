import Foundation

public struct CreditCardProcessor: PaymentProcessor {
    public init() {}

    public let type = PaymentProcessorType.creditCard

    public func processPayment(amount: Double) async throws -> Bool {
        //  Process payment logic:
        try await makeCreditCardPayment()

        print("Processing $\(amount) via credit card succeeded")
        return true
    }

    public func verifyFunds(amount: Double) async throws -> Bool {
        //  Verify credit limit:
        try await verifyCreditCardPayment()

        print("Verifying credit card funds: $\(amount)")
        return true
    }
}

private extension CreditCardProcessor {
    func makeCreditCardPayment() async throws {
        try await Task.sleep(for: .seconds(Double.random(in: 1.5 ... 2.5)))
    }

    func verifyCreditCardPayment() async throws {
        try await Task.sleep(for: .seconds(Double.random(in: 0.8 ... 2.3)))
    }
}
