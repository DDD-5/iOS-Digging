//
//  CalendarUtil.swift
//  Digging
//
//  Created by 황재욱 on 2021/07/13.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Foundation

enum CalendarUnitType {
  case day
  case month
  case year
}

enum CalendarUtil {
  static func calendarNumberTitle(with component: DateComponents?, type: CalendarUnitType) -> String {
    guard let component = component else { return "" }
    switch type {
    case .day:
      return "\(component.day ?? 0)"
    case .month:
      return String(format: "%d%d", component.month ?? 0)
    case .year:
      return "\(component.year ?? 0)"
    }
  }
}
