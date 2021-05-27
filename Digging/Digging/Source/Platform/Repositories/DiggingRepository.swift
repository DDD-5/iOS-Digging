//
//  DiggingRepository.swift
//  Digging
//
//  Created by GisuHwang on 2021/05/24.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Foundation
import Combine
import Moya

protocol DiggingRepository: AnyObject {
	// TODO: MoyaMultiTarget 사용시 스트림이 사라지는 이슈 파악후 사용예정
//	func createDigging<D>(type: D.Type) -> AnyPublisher<D, MoyaError>  where D : Decodable
//	func diggingList<D>(type: D.Type, userID: String) -> AnyPublisher<D, MoyaError>  where D : Decodable
//	func diggingDetail<D>(type: D.Type, diggingID: String) -> AnyPublisher<D, MoyaError>  where D : Decodable
//	func totalTags<D>(type: D.Type, userID: String) -> AnyPublisher<D, MoyaError>  where D : Decodable
	func totlaTags(userID: String) -> AnyPublisher<Data, DiggingNetworkError>
}

class DefaultDiggingRepository: DiggingRepository {
	private let networking: NetworkingProtocol

	init(networking: NetworkingProtocol) {
		self.networking = networking
	}

//	func createDigging<D>(type: D.Type) -> AnyPublisher<D, MoyaError> where D : Decodable {
//		return self.networking.request(DiggingServcie.createDigging)
//			.map(D.self)
//	}
//	func diggingList<D>(type: D.Type, userID: String) -> AnyPublisher<D, MoyaError> where D : Decodable {
//		return self.networking.request(DiggingServcie.diggingList(userID: userID))
//			.map(D.self)
//	}
//
//	func diggingDetail<D>(type: D.Type, diggingID: String) -> AnyPublisher<D, MoyaError> where D : Decodable {
//		return self.networking.request(DiggingServcie.diggingDetail(diggingID: diggingID))
//			.map(D.self)
//	}
//
//	func totalTags<D>(type: D.Type, userID: String) -> AnyPublisher<D, MoyaError> where D : Decodable {
//		return self.networking.request(DiggingServcie.totalTags(userID: userID))
//			.map(D.self)
//	}

	func totlaTags(userID: String) -> AnyPublisher<Data, DiggingNetworkError> {
		return self.networking.request(DiggingServcie.test)
			.map(\.data)
			.eraseToAnyPublisher()

	}

}
func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, DiggingNetworkError> {
	let decoder = JSONDecoder()
	decoder.dateDecodingStrategy = .secondsSince1970

	return Just(data)
		.decode(type: T.self, decoder: decoder)
		.mapError { error in
			DiggingNetworkError.message(error.localizedDescription)
		}
		.eraseToAnyPublisher()
}
