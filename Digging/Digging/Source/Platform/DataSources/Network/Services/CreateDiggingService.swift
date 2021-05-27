//
//  CreateDiggingService.swift
//  Digging
//
//  Created by 황재욱 on 2021/05/27.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Moya

enum CreateDiggingService {
  case createTextDigging(requiredInfo: CreateTextDiggingInfo)
}

extension CreateDiggingService: BaseService {
  
  var path: String {
    switch self {
    case .createTextDigging:
      return "posttext"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .createTextDigging:
      return .post
    }
  }
  
  var sampleData: Data {
    Data()
  }
  
  var task: Task {
    switch self {
    case let .createTextDigging(infoData):
      let json: [String: Any] = [
        "content": infoData.content,
        "tags": infoData.tags,
        "title": infoData.title,
        "user_id": infoData.userID,
        "user_name": infoData.userName
      ]
      
      return .requestCompositeParameters(
        bodyParameters: json,
        bodyEncoding:  JSONEncoding.default,
        urlParameters: [:]
      )
    }
  }
}

