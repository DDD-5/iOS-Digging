//
//  SignInWithAppleButton.swift
//  Digging
//
//  Created by Gisu Hwang on 2021/07/14.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI
import AuthenticationServices

final class SignInWithAppleButton: UIViewRepresentable {
	func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
		return ASAuthorizationAppleIDButton(type: .signIn, style: .whiteOutline)
	}

	func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {

	}
}

final class SignInWithAppleDelegate: NSObject {
	private let signInSucceeded: (Bool) -> Void

	init(onSignedIn: @escaping (Bool) -> Void) {
		signInSucceeded = onSignedIn
	}
}

// MARK: - ASAuthorizationControllerDelegate

extension SignInWithAppleDelegate: ASAuthorizationControllerDelegate {
	func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
		switch authorization.credential {
			case let appleIdCredential as ASAuthorizationAppleIDCredential:
				if let _ = appleIdCredential.email, let _ = appleIdCredential.fullName {
					print("최초 로그인")
					print("identityToken: \(String(describing: appleIdCredential.identityToken))\nauthorizationCode: \(appleIdCredential.authorizationCode!)\nuser: \(appleIdCredential.user)\nemail: \(String(describing: appleIdCredential.email))\ncredential: \(appleIdCredential)")
				} else {
					print("기존 사용자")
					print("identityToken: \(String(describing: appleIdCredential.identityToken))\nauthorizationCode: \(appleIdCredential.authorizationCode!)\nuser: \(appleIdCredential.user)\nemail: \(String(describing: appleIdCredential.email))\ncredential: \(appleIdCredential)")
				}
				signInSucceeded(true)

			default:
				break
		}
	}

	func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {

	}

	private func displayLog(credential: ASAuthorizationAppleIDCredential) {
		print("identityToken: \(String(describing: credential.identityToken))\nauthorizationCode: \(credential.authorizationCode!)\nuser: \(credential.user)\nemail: \(String(describing: credential.email))\ncredential: \(credential)")
	}
}
extension SignInWithAppleDelegate: ASAuthorizationControllerPresentationContextProviding {
	func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
		return UIApplication.shared.windows.last!
	}
}
