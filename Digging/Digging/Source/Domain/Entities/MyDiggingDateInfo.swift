//
//  MyDiggingDateInfo.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/29.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Foundation

struct MyDiggingDateInfo: Decodable {
  let date: String?
  let day: String?
  let id: Int
  let isImage: Bool?
  let isLink: Bool?
  let isText: Bool?
  let resultCode: String?
  var formattedDate: DateComponents? {
    guard let dateString = date else {
      return nil
    }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.date(from: dateString)
    let calendar = Calendar.current
    return calendar.dateComponents([.day, .month, .year], from: date!)
  }
}


