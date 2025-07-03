import Foundation

/// A concrete implementation of `PaymentService` that processes payments using a collection of payment processors.
///
/// - SeeAlso: PaymentService
public struct LivePaymentService: PaymentService {
    /// The available payment processors.
    private let processors: [PaymentProcessor]

    /// Creates a new instance of `LivePaymentService` with the given payment processors.
    /// - Parameter processors: The payment processors to use for handling payments.
    public init(processors: [PaymentProcessor]) {
        self.processors = processors
    }

    /// - SeeAlso: PaymentService.makePayment(amount:processorType:)
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
