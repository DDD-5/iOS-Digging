//
//  BaseViewModel.swift
//  Digging
//
//  Created by 황재욱 on 2021/07/08.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Combine

class BaseViewModel: ObservableObject {
  var subscriptions: Set<AnyCancellable> = .init()
}
