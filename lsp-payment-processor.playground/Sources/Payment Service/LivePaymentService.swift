import Foundation

public struct LivePaymentService: PaymentService {
    private let processors: [PaymentProcessor]

    public init(processors: [PaymentProcessor]) {
        self.processors = processors
    }

    public func makePayment(amount: Double, processorType: PaymentProcessorType) async throws -> Bool {
        guard let processor = getProcessor(for: processorType) else {
            throw PaymentError.processorNotFound
        }
        if try await processor.verifyFunds(amount: amount) {
            return try await processor.processPayment(amount: amount)
        }
        return false
    }
}

private extension LivePaymentService {
    func getProcessor(for type: PaymentProcessorType) -> PaymentProcessor? {
        processors.first(where: { $0.type == type })
    }
}
