//
//  CreateDiggingRepository.swift
//  Digging
//
//  Created by 황재욱 on 2021/05/27.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Combine
import Foundation
import Moya

protocol CreateDiggingRepository {
  func createTextDigging(textDiggingInfo: CreateTextDiggingInfo) -> AnyPublisher<GeneralDiggingInfo, Error>
  
  func createLinkDigging(linkDiggingInfo: CreateLinkDiggingInfo) -> AnyPublisher<GeneralDiggingInfo, Error>
}

class CreateDiggingRepositoryImpl: CreateDiggingRepository {
  
  let provider = MoyaProvider<CreateDiggingService>()
  
  func createTextDigging(textDiggingInfo: CreateTextDiggingInfo) -> AnyPublisher<GeneralDiggingInfo, Error> {
    
    provider.requestPublisher(.createTextDigging(requiredInfo: textDiggingInfo)
    ).handleEvents(receiveOutput: { response in
      print("response: \(response)")
    })
    .map(\.data)
    .decode(
      type: GeneralDiggingInfo.self,
      decoder: JSONDecoder()
    )
    .eraseToAnyPublisher()
  }
  
  func createLinkDigging(linkDiggingInfo: CreateLinkDiggingInfo) -> AnyPublisher<GeneralDiggingInfo, Error> {
    
    provider.requestPublisher(.createLinkDigging(requiredInfo: linkDiggingInfo)
    ).handleEvents(receiveOutput: { response in
      print("response: \(response)")
    })
    .map(\.data)
    .decode(
      type: GeneralDiggingInfo.self,
      decoder: JSONDecoder()
    )
    .eraseToAnyPublisher()
  }
}
