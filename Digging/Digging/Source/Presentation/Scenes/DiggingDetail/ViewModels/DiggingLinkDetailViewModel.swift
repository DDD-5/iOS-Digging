//
//  DiggingLinkDetailViewModel.swift
//  Digging
//
//  Created by GisuHwang on 2021/06/23.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Foundation
import Moya
import Combine

class DiggingLinkDetailViewModel: ObservableObject {
	
	private var cancellables = Set<AnyCancellable>()
	private let provider: MoyaProvider<DiggingServcie> = MoyaProvider<DiggingServcie>()
	private let postID: Int
	@Published var linkDetailDTO: DiggingLinkDetailDTO = .init()
	@Published var tags: [String] = []
	init(postID: Int) {
		self.postID = postID
	}
}

extension DiggingLinkDetailViewModel {
	func fetchDiggingLinkInfo() {
		self.provider.requestPublisher(.diggingDetailLink(postID: postID))
			.print("-- diggingDetailText --")
			.receive(on: DispatchQueue.main)
			.map(\.data)
			.decode(type: DiggingLinkInfo.self, decoder: JSONDecoder())
			.sink(
					receiveCompletion: { [weak self] completion in

						guard case let .failure(error) = completion else { return }

									 print(error)
					},
					receiveValue: { [weak self] in
						self?.generateLinkDetailDTO($0)
					}
			)
			.store(in: &cancellables)
	}
	
	private func generateLinkDetailDTO(_ info: DiggingLinkInfo) {
		self.linkDetailDTO = DiggingLinkDetailDTO(postID: info.postID,
																							linkID:info.linkID,
																							title: info.titile,
																							url: info.url,
																							updatedAt: info.updatedAt,
																							isLike: info.isLike,
																							tags: info.tags)
		self.tags = info.tags
		
	}
}
