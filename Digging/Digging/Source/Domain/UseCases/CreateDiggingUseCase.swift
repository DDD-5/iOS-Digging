//
//  CreateDiggingUseCase.swift
//  Digging
//
//  Created by 황재욱 on 2021/05/27.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Foundation
import Combine

class CreateDiggingUseCase {
  
  let repository: CreateDiggingRepository
  
  init(repository: CreateDiggingRepository) {
    self.repository = repository
  }
}

extension CreateDiggingUseCase {
  
  func createTextDigging(textDiggingInfo: CreateTextDiggingInfo) -> AnyPublisher<GeneralDiggingInfo, Error> {
    return repository.createTextDigging(textDiggingInfo: textDiggingInfo)
  }
}
