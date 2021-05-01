//
//  DiggingFontType.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/19.
//  Copyright © 2021 Oreo. All rights reserved.
//

import Foundation

enum DiggingFontType {
  case bold
  case medium
  case regular
  
  var fontName: String {
    switch self {
    case .regular:
      return "AppleSDGothicNeo-Regular"
    case .medium:
      return "AppleSDGothicNeo-Medium"
    case .bold:
      return "AppleSDGothicNeo-Bold"
    }
  }
}
