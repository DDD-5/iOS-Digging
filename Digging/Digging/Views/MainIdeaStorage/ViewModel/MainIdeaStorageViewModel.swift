//
//  MainIdeaStorageViewModel.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/06.
//

import SwiftUI

class MainIdeaStorageViewModel: ObservableObject {
  // MARK: - Published Properties
  
  @Published var folderTypes: [DiggingFolderInfo] = []
}

class DiggingFolderInfo {
  var type: DiggingFolderType
  
  init(type: DiggingFolderType) {
    self.type = type
  }
}
