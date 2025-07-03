import Foundation

/// Processes payments using bank transfers.
public struct BankTransferProcessor: PaymentProcessor {
    public init() {}

    /// - SeeAlso: PaymentProcessor.type
    public let type = PaymentProcessorType.bankTransfer

    /// - SeeAlso: PaymentProcessor.processPayment(amount:)
    public func processPayment(amount: Double) async throws -> Bool {
        //  Process bank transfer.
        try await makeBankTransfer(amount: amount)

        print("Processing $\(amount) via credit card succeeded")
        return true
    }

    /// - SeeAlso: PaymentProcessor.verifyFunds(amount:)
    public func verifyFunds(amount: Double) async throws -> Bool {
        //  Check bank account balance.
        try await varifyBankTransferLogic(amount: amount)

        print("Verifying credit card funds: $\(amount)")
        return true
    }
}

private extension BankTransferProcessor {
    func makeBankTransfer(amount: Double) async throws {
        try await PaymentProcessorTools.simulateProcessing(
            amount: amount,
            method: type.rawValue,
            minDelay: 0.5,
            maxDelay: 1.0
        )
    }

    func varifyBankTransferLogic(amount: Double) async throws {
        try await PaymentProcessorTools.simulateVerification(
            amount: amount,
            method: type.rawValue,
            minDelay: 0.3,
            maxDelay: 1.1
        )
    }
}
