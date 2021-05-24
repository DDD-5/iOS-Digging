//
//  DiggingRepository.swift
//  Digging
//
//  Created by GisuHwang on 2021/05/24.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Foundation
import Combine

protocol DiggingRepository: AnyObject {
//	func createDigging() -> AnyPublisher<Data, Never>
//	func diggingList(userID: String) -> AnyPublisher<Data, Never>
//	func diggingDetail(diggingID: String) -> AnyPublisher<Data, Never>
//	func totalTags(userID: String) -> AnyPublisher<Data, Never>
}

class DefaultDiggingRepository: DiggingRepository {
	private let networking: NetworkingProtocol
	
	init(networking: NetworkingProtocol) {
		self.networking = networking
	}
	
}
