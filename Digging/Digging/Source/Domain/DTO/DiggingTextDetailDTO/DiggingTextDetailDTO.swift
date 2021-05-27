//
//  DiggingTextDetailDTO.swift
//  Digging
//
//  Created by GisuHwang on 2021/05/27.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Foundation

struct DiggingTextDetailDTO {
	let postID: Int
	let textID: Int
	let title: String
	let content: String
	let updatedAt: String
	let isLike: Bool
	let tags: [String]
}
extension DiggingTextDetailDTO {
	init() {
		postID = 0
		textID = 0
		title = ""
		content = ""
		updatedAt = ""
		isLike = false
		tags = []
	}
	var updateDate: String {
		return dateToString(updatedAt, dateFormat: "yyyy.MM.dd")
	}
}


// TODO: 공통 코드 처리 예정

func dateToString(_ dateAt: String, dateFormat: String) -> String {
	let formatter = ISO8601DateFormatter()
	formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
	guard let createdDate = formatter.date(from: dateAt) else { return ""}
	let createdText = createdDate.toString(dateFormat: dateFormat)
	return createdText
}

extension Date {
	func toString(dateFormat: String, timezone: TimeZone? = .autoupdatingCurrent) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = dateFormat
		dateFormatter.timeZone = timezone
		dateFormatter.locale = Locale(identifier: "ko-kr")

		return dateFormatter.string(from: self)
	}
}
