//
//  MainIdeaStorageViewModel.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/06.
//

import SwiftUI

enum DiggingFolderType: String {
  case text = "텍스트"
  case image = "사진"
  case link = "링크"
  
  var sequenceNumber: Int {
    switch self {
      case .text:   return 0
      case .image:  return 1
      case .link:   return 2
    }
  }
  
  var folderImage: Image {
    switch self {
    case .text:
      return Image(R.image.digging_text_folder_img.name)
    case .image:
      return Image(R.image.digging_image_folder_img.name)
    case .link:
      return Image(R.image.digging_link_folder_img.name)
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
  
  // MARK: - Properties
  
  var id: Int {
    type.sequenceNumber
  }
  
  var type: DiggingFolderType
  
  // MARK: - Con(De)structor
  
  init(type: DiggingFolderType) {
    self.type = type
  }
}
