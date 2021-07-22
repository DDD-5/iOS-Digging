//
//  LoginViewModel.swift
//  Digging
//
//  Created by Gisu Hwang on 2021/07/22.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Foundation
import Moya
import Combine

class LoginViewModel: ObservableObject {

	private var cancellables = Set<AnyCancellable>()
	private let provider: MoyaProvider<DiggingServcie> = MoyaProvider<DiggingServcie>()

	init() {

	}
}

extension LoginViewModel {
	func appleLogin(token: String, userEmail: String) {
		self.provider.requestPublisher(.appleLogin(token: token, userEmail: userEmail))
			.print("-- 애플로그인 --")
			.receive(on: DispatchQueue.main)
			.map(\.data)
			.sink(
				receiveCompletion: { completion in

					guard case let .failure(error) = completion else { return }

					print(error)
				},
				receiveValue: { _ in
					// 내부 토큰 응답 받은후 내부 로그인 처리
				}
			)
			.store(in: &cancellables)
	}
}
