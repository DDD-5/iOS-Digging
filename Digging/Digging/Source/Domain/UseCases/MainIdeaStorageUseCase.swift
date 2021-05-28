//
//  MainIdeaStorageUseCase.swift
//  Digging
//
//  Created by 황재욱 on 2021/05/28.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Combine
import Foundation

class MainIdeaStorageUseCase {
  let repository: MainIdeaStorageRepository
  
  init(repository: MainIdeaStorageRepository) {
    self.repository = repository
  }
}

extension MainIdeaStorageUseCase {
  
  func requestRecentDiggings(userID: Int) -> AnyPublisher<[GeneralDiggingInfo], Error> {
    return repository.requestRecentDiggings(userID: userID)
  }
}
