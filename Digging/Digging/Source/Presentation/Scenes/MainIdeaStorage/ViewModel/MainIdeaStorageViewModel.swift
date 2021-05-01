//
//  MainIdeaStorageViewModel.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/06.
//

import SwiftUI

enum DiggingFolderType {
  case text
  case image
  case link
  
  var sequenceNumber: Int {
    switch self {
      case .text: return 0
      case .image: return 1
      case .link: return 2
    }
  }
}

class MainIdeaStorageViewModel: ObservableObject {
  // MARK: - Published Properties
  
  @Published var folderInfoArray: [DiggingFolderInfo] = []
  
  init() {
    self.folderInfoArray = baseFolderInformations()
  }
  
  private func baseFolderInformations() -> [DiggingFolderInfo] {
    var folderInfoArray: [DiggingFolderInfo] = []
    
    let textFolderInfo = DiggingFolderInfo(type: .text)
    let imageFolderInfo = DiggingFolderInfo(type: .image)
    let linkFolderInfo = DiggingFolderInfo(type: .link)
    
    folderInfoArray.append(
      contentsOf: [
        textFolderInfo,
        imageFolderInfo,
        linkFolderInfo
      ]
    )
    return folderInfoArray
  }
}

class DiggingFolderInfo: Identifiable {
  
  var id: Int {
    type.sequenceNumber
  }
  
  var type: DiggingFolderType
  
  init(type: DiggingFolderType) {
    self.type = type
  }
}
