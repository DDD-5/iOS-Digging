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
    let dateInfoArray: [MyDiggingDateInfo] = []
    return dateInfoArray
  }
}
