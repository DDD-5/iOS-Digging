//
//  MyDiggingInfoViewModel.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/26.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Foundation

import Combine

class MyDiggingInfoViewModel: ObservableObject {
  
  let useCase: MyDiggingInfoUseCase
  
  var subscriptions: Set<AnyCancellable> = .init()
  
  let dayNameAlphabetArray = ["S", "M", "T", "W", "T", "F", "S"]
  
  @Published var firstDayInfo: MyDiggingDateInfo?
  
  @Published var dateInfoArray: [MyDiggingDateInfo] = []
  
  init(useCase: MyDiggingInfoUseCase) {
    self.useCase = useCase
  }
}

extension MyDiggingInfoViewModel {
  
  func requestMonthlyMyDiggingInfo() {
    useCase.requestMonthlyMyDiggingInfo(userID: 1, dateString: "202106")
    .sink { _ in
    } receiveValue: { dateInfo in
      DispatchQueue.main.async { [weak self] in
        self?.dateInfoArray.append(contentsOf: dateInfo)
        self?.firstDayInfo = dateInfo.first
      }
    }
    .store(in: &subscriptions)
  }
}
