import Foundation

public enum PaymentProcessorType: Equatable, CaseIterable, Sendable {
    case creditCard
    case bankTransfer
}
