import Foundation

public protocol PaymentService: Sendable {
    func makePayment(amount: Double, processorType: PaymentProcessorType) async throws -> Bool
}
