//
//  GeneralDiggingInfo.swift
//  Digging
//
//  Created by 황재욱 on 2021/05/27.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Foundation

struct GeneralDiggingInfo: Decodable {
  let content: String?
  let url: String?
  let postID: Int
  let type: String?
  
  enum CodingKeys: String, CodingKey {
    case content, url, type
    case postID = "post_id"
  }
}
