# README #

# BynnIDVerification

## Overview

BynnIDVerification is a Swift framework that provides identity verification functionality for iOS applications. Bynn allows simple integration of identity verification features into your iOS apps.

## Screenshots

### Initial View
![Verification Flow](screenshots/intro.png)

### Document Scan
![Document Scan](screenshots/id.png)

### Liveness Info
![Liveness Detection](screenshots/liveness-info.png)

## Installation

### Swift Package Manager
https://github.com/Bynn-Intelligence/Bynn-Mobile-SDK-iOS.git

## Key Components

**BynnVerification**  
The main entry point for the SDK. This class provides the interface to create and configure verification flows.

## Usage

### Basic Implementation

```swift
import SwiftUI
import BynnIDVerification

struct ContentView: View {
    @State private var showVerification = false
    
    var body: some View {
        Button("Start Verification") {
            showVerification = true
        }
        .sheet(isPresented: $showVerification) {
            VerificationView()
        }
    }
}

struct VerificationView: View {
    @State private var verificationView: AnyView?
    
    var body: some View {
        VStack {
            if let view = verificationView {
                view
            } else {
                ProgressView("Loading verification flow...")
                    .onAppear {
                        Task {
                            await loadVerificationFlow()
                        }
                    }
            }
        }
    }
    
    func loadVerificationFlow() async {
        let view = await BynnVerification.shared.createVerificationFlow(
            apiKey: "YOUR_API_KEY",
            kycLevel: "KYC_level",
            firstName: "John",
            lastName: "Doe",
            uniqueId: "user-123",
            phoneNumber: "+1234567890",
            email: "john.doe@example.com",
            ageVerification: false
            showCompletionView: true,
            onVerificationCompleted: {
                print("Verification completed successfully")
            },
            onVerificationCancelled: {
                print("Verification was cancelled")
            },
            onVerificationError: { errorMessage in
                print("Verification error: \(errorMessage)")
            }
        )
        
        verificationView = view
    }
}
```

## Configuration Options

### KYC Levels

BynnIDVerification supports different KYC levels found in your Bynn account.

### Age Verification

BynnIDVerification has a specialized flow for age verification. To initiate the age verification flow, simply pass ageVerification: true. The UniqueId parameter must contain an id for age verification:

```swift
let ageVerificationView = await BynnVerification.shared.createVerificationFlow(
    apiKey: "YOUR_API_KEY",
    kycLevel: "STANDARD",
    uniqueId: "user-123",
    ageVerification: true,
    showCompletionView: true
)
```

### Age Verification Info
![Age Verification](screenshots/age-verification.png)

## Error Handling

BynnIDVerification provides error handling through the onVerificationError callback.

## API Reference

### BynnVerification

```swift
public func createVerificationFlow(
    apiKey: String,
    kycLevel: String,
    firstName: String?,
    lastName: String?,
    uniqueId: String?,
    phoneNumber: String?,
    email: String?,
    ageVerification: Bool = false,
    showCompletionView: Bool,
    onVerificationCompleted: (() -> Void)? = nil,
    onVerificationCancelled: (() -> Void)? = nil,
    onVerificationError: ((String) -> Void)? = nil
) async -> AnyView
```

## Version History

- 1.0.0: Initial release

## Support

For questions or issues, please contact TEST
