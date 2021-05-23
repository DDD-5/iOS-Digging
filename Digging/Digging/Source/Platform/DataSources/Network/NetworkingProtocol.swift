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
