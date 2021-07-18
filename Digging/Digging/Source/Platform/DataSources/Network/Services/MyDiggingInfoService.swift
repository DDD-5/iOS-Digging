//
//  MyDiggingInfoService.swift
//  Digging
//
//  Created by 황재욱 on 2021/06/26.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Moya

enum MyDiggingInfoService {
  case fetchMyDiggingInfoByMonth(userID: Int, dateString: String)
  case fetchMyDiggingInfoByDay(userID: Int, dateString: String)
}

extension MyDiggingInfoService: BaseService {
  
  var path: String {
    switch self {
    case .fetchMyDiggingInfoByMonth:
      return "calendar/allcheck"
    case .fetchMyDiggingInfoByDay:
      return "calendar/readdaypost"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .fetchMyDiggingInfoByMonth:
      return .get
    case .fetchMyDiggingInfoByDay:
      return .get
    }
  }
  
  var sampleData: Data {
    Data()
  }
  
  var task: Task {
    switch self {
    case let .fetchMyDiggingInfoByMonth(userID, date):
      let parameters: [String: Any] = [
        "userid" : userID,
        "yyyyMM": date
      ]
      return .requestParameters(
        parameters: parameters,
        encoding: URLEncoding.queryString
      )
    case let .fetchMyDiggingInfoByDay(userID, date):
      let parameters: [String: Any] = [
        "userid" : userID,
        "yyyyMM": date
      ]
      return .requestParameters(
        parameters: parameters,
        encoding: URLEncoding.queryString
      )
    }
  }
}
