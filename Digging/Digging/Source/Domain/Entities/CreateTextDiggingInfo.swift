//
//  CreateTextDiggingInfo.swift
//  Digging
//
//  Created by 황재욱 on 2021/05/27.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Foundation

struct CreateTextDiggingInfo: Encodable {
  let content: String
  let tags: [String]?
  let title: String
  let userName: String
  let userID: Int
  
  enum CodingKeys: String, CodingKey {
    case content, title, tags
    case userName = "user_name"
    case userID = "user_id"
  }
}
