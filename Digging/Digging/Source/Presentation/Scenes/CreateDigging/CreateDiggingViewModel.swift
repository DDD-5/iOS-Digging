//
//  CreateDiggingViewModel.swift
//  Digging
//
//  Created by 황재욱 on 2021/05/27.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Foundation
import Combine

class CreateDiggingViewModel: ObservableObject {
  
  let useCase: CreateDiggingUseCase
  
  var subscriptions: Set<AnyCancellable> = .init()
  
  init(useCase: CreateDiggingUseCase) {
    self.useCase = useCase
  }
}

extension CreateDiggingViewModel {
  
  
  func createTextDigging(info: CreateTextDiggingInfo) {
    
    useCase.createTextDigging(textDiggingInfo: info)
      .sink { _ in
        print("completed")
      } receiveValue: { info in
        print("Received : \(info)")
      }
      .store(in: &subscriptions)
  }
}
