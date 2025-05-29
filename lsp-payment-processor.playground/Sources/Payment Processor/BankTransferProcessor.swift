import Foundation

public struct BankTransferProcessor: PaymentProcessor {
    public init() {}

    public let type = PaymentProcessorType.bankTransfer

    public func processPayment(amount: Double) async throws -> Bool {
        //  Process bank transfer.
        try await makeBankTransfer()

        print("Processing $\(amount) via credit card succeeded")
        return true
    }

    public func verifyFunds(amount: Double) async throws -> Bool {
        //  Check bank account balance.
        try await varifyBankTransferLogic()

        print("Verifying credit card funds: $\(amount)")
        return true
    }
}

private extension BankTransferProcessor {
    func makeBankTransfer() async throws {
        try await Task.sleep(for: .seconds(Double.random(in: 0.5 ... 1)))
    }

    func varifyBankTransferLogic() async throws {
        try await Task.sleep(for: .seconds(Double.random(in: 0.3 ... 1.1)))
    }
}
