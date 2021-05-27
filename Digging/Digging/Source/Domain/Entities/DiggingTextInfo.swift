//
//  DiggingTextInfo.swift
//  Digging
//
//  Created by GisuHwang on 2021/05/27.
//  Copyright © 2021 Oreo. All rights reserved.
//

// TODO: 추후 API 변경에 따라, Entities 변경이 필요해 보임. 공통 변수 중복이 많아 프로토콜 처리 예정
struct DiggingTextInfo: Codable {
	let postID: Int
	let textID: Int
	let titile: String
	let content: String
	let isLike: Bool
	let createdAt: String
	let updatedAt: String
	let tags: [String]
	
	private enum CodingKeys: String, CodingKey {
		case postID = "post_id"
		case textID = "text_id"
		case titile
		case content
		case isLike = "is_like"
		case createdAt = "created_at"
		case updatedAt = "updated_at"
		case tags
	}
}
