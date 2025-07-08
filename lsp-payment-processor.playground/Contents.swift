import UIKit

let bankTransferProcessor = BankTransferProcessor()
let creditCardProcessor = CreditCardProcessor()
let cryptoProcessor = CryptoPaymentProcessor(
    locationService: LiveLocationService(),
    cryptoSupportChecker: LiveCryptoSupportChecker()
)
let nextGenCryptoProcessor = NextGenCryptoPaymentsProcessor(
    locationService: LiveLocationService(),
    cryptoSupportChecker: LiveCryptoSupportChecker()
)
let paymentSerice = LivePaymentService(
    processors: [
        creditCardProcessor,
        bankTransferProcessor,
        cryptoProcessor,
        nextGenCryptoProcessor
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
    
    let nextGenCryptoResult = try await paymentSerice.makePayment(
        amount: 100.0,
        processorType: .nextGenCrypto
    )
    print("Payment by next gen crypto: \(nextGenCryptoResult)")
}
