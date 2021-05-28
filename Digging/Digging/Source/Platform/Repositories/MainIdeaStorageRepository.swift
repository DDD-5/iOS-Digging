//
//  MainIdeaStorageRepository.swift
//  Digging
//
//  Created by 황재욱 on 2021/05/28.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Combine
import Moya

protocol MainIdeaStorageRepository {
  
  func requestRecentDiggings(userID: Int) -> AnyPublisher<[GeneralDiggingInfo], Error>
}

class MainIdeaStorageRepositoryImpl: MainIdeaStorageRepository {
  
  let provider = MoyaProvider<MainIdeaStorageService>()
  
  func requestRecentDiggings(userID: Int) -> AnyPublisher<[GeneralDiggingInfo], Error> {
    
    provider
      .requestPublisher(.requestRecentDiggings(userID: userID))
      .handleEvents(receiveOutput: { (res) in        print("Thisis res: \(res)")
      })
      .map(\.data)
      .decode(
        type: [GeneralDiggingInfo].self,
        decoder: JSONDecoder()
      )
      .eraseToAnyPublisher()
  }
}
