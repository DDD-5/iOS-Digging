//
//  MyDiggingInfoUseCase.swift
//  Digging
//
//  Created by 황재욱 on 2021/07/07.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Combine

class MyDiggingInfoUseCase {
  let repository: MyDiggingInfoRepository
  
  init(repository: MyDiggingInfoRepository) {
    self.repository = repository
  }
}

extension MyDiggingInfoUseCase {
  func requestMonthlyMyDiggingInfo(userID: Int, dateString: String) -> AnyPublisher<[MyDiggingDateInfo], Error> {
    return repository.requetMonthlyDiggingInfo(
      userID: userID,
      dateString: dateString
    )
  }
}
