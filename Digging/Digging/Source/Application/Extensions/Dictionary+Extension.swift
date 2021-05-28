//
//  Dictionary+Extension.swift
//  Digging
//
//  Created by GisuHwang on 2021/05/27.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Foundation

// MARK: - Dictionary
extension Dictionary {
	mutating func concat(dict: [Key: Value]) {
		for (key, value) in dict {
			updateValue(value, forKey: key)
		}
	}
}
