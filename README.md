# Liskov Substitution Principle (LSP) Showcase

The Liskov Substitution Principle (LSP) is the "L" in S.O.L.I.D. and states that objects of a superclass should be replaceable with objects of its subclasses without breaking the application. This playground demonstrates how to design a payment service in Swift that adheres to LSP, making it easy to extend and maintain.

## About This Playground

This project presents a simple payment service architecture, showing how to add new payment processors (like credit card, bank transfer, and crypto) without modifying existing code. The design ensures that all payment processors conform to a common protocol, allowing them to be used interchangeably.

### Key Concepts Illustrated

- **Protocol-Oriented Design:** All payment processors conform to a `PaymentProcessor` protocol, ensuring substitutability.
- **Extensibility:** New payment methods can be added by implementing the protocol, without changing the payment service logic.
- **Error Handling:** Custom error types and eligibility checks are used to handle payment failures and unsupported scenarios.
- **Helpers and Utilities:** Shared logic (like async simulation and country support checks) is extracted into helper services for reuse and clarity.

## Example Usage

```swift
let paymentService = LivePaymentService(processors: [
    CreditCardProcessor(),
    BankTransferProcessor(),
    CryptoPaymentProcessor(...),
    NextGenCryptoPaymentsProcessor(...)
])

try await paymentService.makePayment(amount: 100, with: .crypto)
```


## Technicalities

### Requirements

- Xcode 15+ (might run on lower version as well).
- Swift 5.9+

### Running the project

- Check out or download the project.
- Open the `lsp-payment-processor.playground` file in Xcode.
