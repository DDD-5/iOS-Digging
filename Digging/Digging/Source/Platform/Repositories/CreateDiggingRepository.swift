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
}

class CreateDiggingRepositoryImpl: CreateDiggingRepository {
  
  private let networking: NetworkingProtocol

  init(networking: NetworkingProtocol) {
    self.networking = networking
  }
  
  func createTextDigging(textDiggingInfo: CreateTextDiggingInfo) -> AnyPublisher<GeneralDiggingInfo, Error> {
    
    networking.request(CreateDiggingService.createTextDigging(requiredInfo: textDiggingInfo))
      .map({ response -> Response in
        print("안오는데..: \(response)")
        return response
      })
      .map(\.data)
      .handleEvents( receiveOutput: { response in
        print("This is response: \(response)")
      })
      .decode(type: GeneralDiggingInfo.self, decoder: JSONDecoder()
      )
      .eraseToAnyPublisher()
  }
}
