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
  
  @Published var dateInfoArray: [MyDiggingDateInfo] = [MyDiggingDateInfo(date: "2021-06-21", day: "1", id: 1, isImage: nil, isLink: nil, isText: nil, resultCode: nil)]
  
  init(useCase: MyDiggingInfoUseCase) {
    self.useCase = useCase
  }
}

extension MyDiggingInfoViewModel {
  
  func requestMonthlyMyDiggingInfo() {
    useCase.requestMonthlyMyDiggingInfo(userID: 1, dateString: "202106")
    .sink { _ in
      print("completed")
    } receiveValue: { dateInfo in
      DispatchQueue.main.async {
        self.dateInfoArray.append(contentsOf: dateInfo)
      }
      print("date info \(dateInfo)")
    }
    .store(in: &subscriptions)
  }
}
