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
    let testInfo = CreateTextDiggingInfo(content: "디깅 내용", tags: ["Swift"], title: "디깅 제목", userName: "TestUser1", userID: 13)
    createTextDigging(info: testInfo)
  }
}

extension CreateDiggingViewModel {
  
  
  func createTextDigging(info: CreateTextDiggingInfo) {
    var request = URLRequest(url: URL(string: "http://3.36.82.56:8080/posttext/")!)
    request.httpMethod = "POST"
    
    let json: [String: Any] = [
      "content": info.content,
      "tags": info.tags,
      "title": info.title,
      "user_id": info.userID,
      "user_name": info.userName
    ]
    
    if let jsonData = try? JSONSerialization.data(withJSONObject: json) {
      request.httpBody = jsonData
    }
    
    URLSession.shared.dataTaskPublisher(for: request)
      .sink { error in
      print(error)
    } receiveValue: { response in
      print("This is enw : \(response.data). \(response.response)")
    }
    .store(in: &subscriptions)

    
    
    useCase.createTextDigging(textDiggingInfo: info)
      .sink { _ in
        print("completed")
      } receiveValue: { info in
        print("Received : \(info)")
      }
      .store(in: &subscriptions)
  }
}
