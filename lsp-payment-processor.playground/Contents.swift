import UIKit

let bankTransferProcessor = BankTransferProcessor()
let creditCardProcessor = CreditCardProcessor()
let paymentSerice = LivePaymentService(
    processors: [
        creditCardProcessor,
        bankTransferProcessor
    ]
)

Task {
    let result = try await paymentSerice.makePayment(
        amount: 20.0,
        processorType: .bankTransfer
    )
    print("Payment by bank transfer: \(result)")
}
