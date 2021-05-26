//
//  BaseService.swift
//  Digging
//
//  Created by GisuHwang on 2021/05/24.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Moya

protocol BaseService: TargetType { }

enum BaseServiceError: Error {
	case message(String)
}

extension BaseService {
	var baseURL: URL {
		// TODO: configuration 으로 대체예정 임시 테스트 url 리터럴처리
		guard let url = URL(string: "https://jsonplaceholder.typicode.com") else { fatalError("Bad URL Request") }
		return url
	}

	var headers: [String: String]? {
		return ["Content-Type": "application/json"]
	}

	var sampleData: Data {
		guard let data = "Data".data(using: String.Encoding.utf8) else { return Data() }
		return data
	}
}

extension BaseServiceError: LocalizedError {
	var errorDescription: String? {
		switch self {
			case .message(let message):
			return NSLocalizedString(message, comment: "serverError")
		}
	}
}
