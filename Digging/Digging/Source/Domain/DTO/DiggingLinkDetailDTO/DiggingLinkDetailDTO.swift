//
//  DiggingLinkDetailDTO.swift
//  Digging
//
//  Created by GisuHwang on 2021/06/23.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Foundation

struct DiggingLinkDetailDTO {
	let postID: Int
	let linkID: Int
	let title: String
	let url: String
	let updatedAt: String
	let isLike: Bool
	let tags: [String]
}
extension DiggingLinkDetailDTO {
	init() {
		postID = 0
		linkID = 0
		title = ""
		url = ""
		updatedAt = ""
		isLike = false
		tags = []
	}

	var updateDate: String {

		return dateToString(updatedAt, dateFormat: "yyyy.MM.dd")
	}
}
