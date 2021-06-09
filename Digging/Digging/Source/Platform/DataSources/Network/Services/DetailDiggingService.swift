//
//  DetailDiggingService.swift
//  Digging
//
//  Created by 황재욱 on 2021/06/10.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Moya

enum DetailDiggingService {
  case deleteDigging
}

extension DetailDiggingService: BaseService {
  
  var path: String {
    switch self {
    case .deleteDigging:
      return "api/user/"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .deleteDigging:
      return .delete
    }
  }
  
  var task: Task {
    switch self {
    case .deleteDigging:
      return .requestPlain
    }
  }
}
