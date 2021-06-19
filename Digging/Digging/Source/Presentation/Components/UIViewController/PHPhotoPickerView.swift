//
//  PHPhotoPickerView.swift
//  Digging
//
//  Created by 황재욱 on 2021/06/19.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI
import PhotosUI

struct PHPhotoPickerView: UIViewControllerRepresentable {
  let configuration: PHPickerConfiguration
  
  @Binding var isPresented: Bool
  
  func makeUIViewController(context: Context) -> PHPickerViewController {
    let controller = PHPickerViewController(configuration: configuration)
    controller.delegate = context.coordinator
    return controller
  }
  
  func updateUIViewController(
    _ uiViewController: PHPickerViewController,
    context: Context
  ) { }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  class Coordinator: PHPickerViewControllerDelegate {
    
    private let parent: PHPhotoPickerView
    
    init(_ parent: PHPhotoPickerView) {
      self.parent = parent
    }
    func picker(
      _ picker: PHPickerViewController,
      didFinishPicking results: [PHPickerResult]
    ) {
      print(results)
      parent.isPresented = false
    }
  }
}
