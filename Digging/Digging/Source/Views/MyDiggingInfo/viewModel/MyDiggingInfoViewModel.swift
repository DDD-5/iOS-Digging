//
//  MyDiggingInfoViewModel.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/26.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Foundation

class MyDiggingInfoViewModel: ObservableObject {
  
  let dayNameAlphabetArray = ["S", "M", "T", "W", "T", "F", "S"]
  
  var dateInfoArray: [MyDiggingDateInfo] = []
  
  init() {
    dateInfoArray = setupDateInfoArray()
  }
}

extension MyDiggingInfoViewModel {
  
  func setupDateInfoArray() -> [MyDiggingDateInfo] {
    let dateInfoArray = [
      MyDiggingDateInfo(id: 0, dataNumber: 0, isStored: false),
      MyDiggingDateInfo(id: 1, dataNumber: 0, isStored: false),
      MyDiggingDateInfo(id: 2, dataNumber: 0, isStored: false),
      MyDiggingDateInfo(id: 3, dataNumber: 1, isStored: false),
      MyDiggingDateInfo(id: 4, dataNumber: 2, isStored: false),
      MyDiggingDateInfo(id: 5, dataNumber: 3, isStored: false),
      MyDiggingDateInfo(id: 6, dataNumber: 4, isStored: false),
      MyDiggingDateInfo(id: 7, dataNumber: 5, isStored: false),
      MyDiggingDateInfo(id: 8, dataNumber: 6, isStored: false),
      MyDiggingDateInfo(id: 9, dataNumber: 7, isStored: false),
      MyDiggingDateInfo(id: 10, dataNumber: 8, isStored: false),
      MyDiggingDateInfo(id: 11, dataNumber: 9, isStored: false),
      MyDiggingDateInfo(id: 12, dataNumber: 10, isStored: false),
      MyDiggingDateInfo(id: 13, dataNumber: 11, isStored: true),
      MyDiggingDateInfo(id: 14, dataNumber: 12, isStored: false),
      MyDiggingDateInfo(id: 15, dataNumber: 13, isStored: false),
      MyDiggingDateInfo(id: 16, dataNumber: 14, isStored: false),
      MyDiggingDateInfo(id: 17, dataNumber: 15, isStored: true),
      MyDiggingDateInfo(id: 18, dataNumber: 16, isStored: false),
      MyDiggingDateInfo(id: 19, dataNumber: 17, isStored: true),
      MyDiggingDateInfo(id: 20, dataNumber: 18, isStored: false),
      MyDiggingDateInfo(id: 21, dataNumber: 19, isStored: false),
      MyDiggingDateInfo(id: 22, dataNumber: 20, isStored: false),
      MyDiggingDateInfo(id: 23, dataNumber: 21, isStored: false),
      MyDiggingDateInfo(id: 24, dataNumber: 22, isStored: false),
      MyDiggingDateInfo(id: 25, dataNumber: 23, isStored: false),
      MyDiggingDateInfo(id: 26, dataNumber: 24, isStored: false),
      MyDiggingDateInfo(id: 27, dataNumber: 25, isStored: false),
      MyDiggingDateInfo(id: 28, dataNumber: 26, isStored: false),
      MyDiggingDateInfo(id: 29, dataNumber: 27, isStored: false),
      MyDiggingDateInfo(id: 30, dataNumber: 28, isStored: false),
      MyDiggingDateInfo(id: 31, dataNumber: 29, isStored: false),
      MyDiggingDateInfo(id: 32, dataNumber: 30, isStored: false),
      MyDiggingDateInfo(id: 33, dataNumber: 31, isStored: false)
    ]
    return dateInfoArray
  }
}
