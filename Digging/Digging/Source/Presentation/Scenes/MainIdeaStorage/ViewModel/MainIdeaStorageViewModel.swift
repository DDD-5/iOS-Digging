//
//  MainIdeaStorageViewModel.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/06.
//

import SwiftUI
import Combine

enum DiggingFolderType: String {
  case text = "text"
  case image = "image"
  case link = "link"
  
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
  
  var smallImage: Image {
    switch self {
    case .text:
      return Image(R.image.digging_text_folder_small_img.name)
    case .image:
      return Image(R.image.digging_image_folder_img.name)
    case .link:
      return Image(R.image.digging_link_folder_small_img.name)
    }
  }
  
  var typeName: String {
    switch self {
    case .text:
      return "텍스트"
    case .image:
      return "이미지"
    case .link:
      return "링크"
    }
  }
  
  var contentName: String {
    switch self {
    case .text:
      return "내용"
    case .image:
      return "이미지"
    case .link:
      return "링크"
    }
  }
}

class MainIdeaStorageViewModel: ObservableObject {
  
  let useCase: MainIdeaStorageUseCase
  
  var subscriptions: Set<AnyCancellable> = .init()
  
  
  
  // MARK: - Published Properties
  
  @Published var folderInfoArray: [DiggingFolderInfo] = []
  
  @Published var recentDiggingList: [GeneralDiggingInfo] = []
  
  init(useCase: MainIdeaStorageUseCase) {
    self.useCase = useCase
    self.folderInfoArray = baseFolderInformations()
    requestRecentDiggings(userID: 13)
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
  
  func requestRecentDiggings(userID: Int) {
    useCase.requestRecentDiggings(userID: userID).sink { _ in
      print("Completed")
    } receiveValue: { [weak self] diggingInfo in
      print("\(diggingInfo)")
      self?.recentDiggingList = diggingInfo
    }
    .store(in: &subscriptions)
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
