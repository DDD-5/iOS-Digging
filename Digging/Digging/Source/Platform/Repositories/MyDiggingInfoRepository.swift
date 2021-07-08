//
//  MyDiggingInfoRepository.swift
//  Digging
//
//  Created by 황재욱 on 2021/07/04.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Foundation
import Moya
import Combine

protocol MyDiggingInfoRepository {
  func requetMonthlyDiggingInfo(userID: Int, dateString: String) -> AnyPublisher<[MyDiggingDateInfo], Error>
}

class MyDiggingInfoRepositoryImpl: MyDiggingInfoRepository {
  
  let provider = MoyaProvider<MyDiggingInfoService>()
  
  func requetMonthlyDiggingInfo(userID: Int, dateString: String) -> AnyPublisher<[MyDiggingDateInfo], Error> {
    return provider
      .requestPublisher(.fetchMyDiggingInfoByMonth(userID: userID, dateString: dateString))
      .handleEvents(receiveOutput: { response in
        print("response: \(response)")
      })
      .map(\.data)
      .decode(
        type: [MyDiggingDateInfo].self,
        decoder: JSONDecoder()
      )
      .eraseToAnyPublisher()
  }
}
