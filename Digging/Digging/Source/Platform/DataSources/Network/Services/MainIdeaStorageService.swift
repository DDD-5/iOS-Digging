//
//  MainIdeaStorageService.swift
//  Digging
//
//  Created by 황재욱 on 2021/05/28.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Foundation

import Moya

enum MainIdeaStorageService {
  case requestRecentDiggings(userID: Int)
}

extension MainIdeaStorageService: BaseService {
  
  var path: String {
    switch self {
    case .requestRecentDiggings:
      return "recent/"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .requestRecentDiggings:
      return .get
    }
  }
  
  var sampleData: Data {
    Data()
  }
  
  var task: Task {
    switch self {
    case let .requestRecentDiggings(userID):
      
      return .requestParameters(
        parameters: ["userid" : userID],
        encoding: URLEncoding.queryString
      )
    }
  }
}

