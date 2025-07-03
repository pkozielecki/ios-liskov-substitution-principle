import Foundation

/// Utility struct for simulating payment processing and fund verification with delays and logging.
public struct PaymentProcessorTools {
    /// Simulates the processing of a payment with a random delay and logs the result.
    /// - Parameters:
    ///   - amount: The amount to process.
    ///   - method: The payment method name (e.g., "credit card").
    ///   - minDelay: The minimum delay in seconds.
    ///   - maxDelay: The maximum delay in seconds.
    public static func simulateProcessing(
        amount: Double,
        method: String,
        minDelay: Double,
        maxDelay: Double
    ) async throws {
        try await Task.sleep(for: .seconds(Double.random(in: minDelay...maxDelay)))
        print("Processing $\(amount) via \(method) succeeded")
    }

    /// Simulates the verification of funds with a random delay and logs the result.
    /// - Parameters:
    ///   - amount: The amount to verify.
    ///   - method: The payment method name (e.g., "credit card").
    ///   - minDelay: The minimum delay in seconds.
    ///   - maxDelay: The maximum delay in seconds.
    public static func simulateVerification(
        amount: Double,
        method: String,
        minDelay: Double,
        maxDelay: Double
    ) async throws {
        try await Task.sleep(for: .seconds(Double.random(in: minDelay...maxDelay)))
        print("Verifying \(method) funds: $\(amount)")
    }
}
