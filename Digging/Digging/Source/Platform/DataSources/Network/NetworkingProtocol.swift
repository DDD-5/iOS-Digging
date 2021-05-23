//
//  NetworkingProtocol.swift
//  Digging
//
//  Created by GisuHwang on 2021/05/23.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Moya
import Combine

protocol NetworkingProtocol {
	func request(_ target: TargetType, file: StaticString, function: StaticString, line: UInt) -> AnyPublisher<Response, MoyaError>
	
}

extension NetworkingProtocol {
	func request(_ target: TargetType, file: StaticString = #file, function: StaticString = #function, line: UInt = #line) -> AnyPublisher<Response, MoyaError> {
		return self.request(target, file: file, function: function, line: line)
	}
}

final class Networking: MoyaProvider<MultiTarget>, NetworkingProtocol {

	
	init(logger: [PluginType]) {
		
		let session = MoyaProvider<MultiTarget>.defaultAlamofireSession()
		session.sessionConfiguration.timeoutIntervalForRequest = 10
		super.init(requestClosure: { endpoint, completion in
			do {
				var urlRequest = try endpoint.urlRequest()
				urlRequest.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
			} catch MoyaError.requestMapping(let url) {
				completion(.failure(MoyaError.requestMapping(url)))
			} catch MoyaError.parameterEncoding(let error) {
				completion(.failure(MoyaError.parameterEncoding(error)))
			} catch {
				completion(.failure(MoyaError.underlying(error, nil)))
			}
		}, session: session, plugins: logger)
	}
	
	// TODO: Request 함수 구현 에정
//	func request(_ target: TargetType, file: StaticString, function: StaticString, line: UInt) -> AnyPublisher<Response, MoyaError> {
//		return self.requestPublisher(.target(target))
//			.filterSuccessfulStatusCodes()
//	}
}
