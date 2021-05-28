//
//  DiggingTextDetailViewModel.swift
//  Digging
//
//  Created by GisuHwang on 2021/05/27.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Foundation
import Moya
import Combine

class DiggingTextDetailViewModel: ObservableObject {
	
	private var cancellables = Set<AnyCancellable>()
	private let provider: MoyaProvider<DiggingServcie> = MoyaProvider<DiggingServcie>()
	private let postID: Int
	@Published var textDetailDTO: DiggingTextDetailDTO = .init()
	@Published var tags: [String] = []
	init(postID: Int) {
		self.postID = postID
	}
}

extension DiggingTextDetailViewModel {
	func fetchDiggingTextInfo() {
		self.provider.requestPublisher(.diggingDetailText(postID: postID))
			.print("-- diggingDetailText --")
			.receive(on: DispatchQueue.main)
			.map(\.data)
			.decode(type: DiggingTextInfo.self, decoder: JSONDecoder())
			.sink(
					receiveCompletion: { [weak self] completion in

						guard case let .failure(error) = completion else { return }

									 print(error)
					},
					receiveValue: { [weak self] in
						self?.generateTextDetailDTO($0)
					}
			)
			.store(in: &cancellables)
	}
	
	private func generateTextDetailDTO(_ info: DiggingTextInfo) {
		self.textDetailDTO = DiggingTextDetailDTO(postID: info.postID,
												 textID: info.textID,
												 title: info.titile,
												 content: info.content,
												 updatedAt: info.updatedAt,
												 isLike: info.isLike,
												 tags: info.tags)
		self.tags = info.tags

	}
}
