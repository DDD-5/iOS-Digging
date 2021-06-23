//
//  DiggingLinkInfo.swift
//  Digging
//
//  Created by GisuHwang on 2021/06/23.
//  Copyright © 2021 Oreo. All rights reserved.
//

struct DiggingLinkInfo: Codable {
	let postID: Int
	let linkID: Int
	let titile: String
	let url: String
	let isLike: Bool
	let createdAt: String
	let updatedAt: String
	let tags: [String]
	
	private enum CodingKeys: String, CodingKey {
		case postID = "post_id"
		case linkID = "link_id"
		case titile = "title"
		case url = "url"
		case isLike = "is_like"
		case createdAt = "created_at"
		case updatedAt = "updated_at"
		case tags = "tags"
	}
}

