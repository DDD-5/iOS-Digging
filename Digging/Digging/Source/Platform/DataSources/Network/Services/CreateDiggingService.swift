//
//  CreateDiggingService.swift
//  Digging
//
//  Created by 황재욱 on 2021/05/27.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Moya

enum CreateDiggingService {
  case createTextDigging
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
    case .createTextDigging:
      return .requestPlain
    }
  }
}

