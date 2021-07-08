//
//  MyDiggingInfoViewModel.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/26.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Foundation

class MyDiggingInfoViewModel: BaseViewModel {
  
  let useCase: MyDiggingInfoUseCase
  
  let dayNameAlphabetArray = ["S", "M", "T", "W", "T", "F", "S"]
  
  var dateInfoArray: [MyDiggingDateInfo] = []
  
  init(useCase: MyDiggingInfoUseCase) {
    self.useCase = useCase
  }
}

extension MyDiggingInfoViewModel {
  
  func setupDateInfoArray() -> [MyDiggingDateInfo] {
    let dateInfoArray: [MyDiggingDateInfo] = []
    return dateInfoArray
  }
  
  func requestMonthlyMyDiggingInfo() {
    useCase.requestMonthlyMyDiggingInfo(userID: 1, dateString: "202106")
    .sink { _ in
      print("completed")
    } receiveValue: { dateInfo in
      self.dateInfoArray = dateInfo
      print("date info \(dateInfo)")
    }
    .store(in: &subscriptions)
  }
}
