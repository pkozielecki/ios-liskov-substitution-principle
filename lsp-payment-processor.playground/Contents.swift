import UIKit

let bankTransferProcessor = BankTransferProcessor()
let creditCardProcessor = CreditCardProcessor()
let cryptoProcessor = CryptoPaymentProcessor(
    locationService: LiveLocationService(),
    cryptoSupportChecker: LiveCryptoSupportChecker()
)
let paymentSerice = LivePaymentService(
    processors: [
        creditCardProcessor,
        bankTransferProcessor,
        cryptoProcessor
    ]
)

Task {
    let result = try await paymentSerice.makePayment(
        amount: 20.0,
        processorType: .bankTransfer
    )
    print("Payment by bank transfer: \(result)")
    
    let cryptoResult = try await paymentSerice.makePayment(
        amount: 50.0,
        processorType: .crypto
    )
    print("Payment by crypto: \(cryptoResult)")
}
