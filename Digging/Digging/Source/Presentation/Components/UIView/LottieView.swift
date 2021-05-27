//
//  LottieView.swift
//  Digging
//
//  Created by 황재욱 on 2021/05/06.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI
import UIKit
import Lottie

struct LottieView: UIViewRepresentable {
  
  // MARK: - Properties
  
  var filename: String
  
  // MARK: - Internal methods
  
  func makeUIView(context: Context) -> UIView {
    let view = UIView()
    let lottieView = AnimationView(name: filename)
    lottieView.loopMode = .loop
    lottieView.play()
    lottieView.contentMode = .scaleAspectFit
    lottieView.backgroundBehavior = .pauseAndRestore
    lottieView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(lottieView)
    
    NSLayoutConstraint.activate([
      lottieView.widthAnchor.constraint(equalTo: view.widthAnchor),
      lottieView.heightAnchor.constraint(equalTo: view.heightAnchor)
    ])
    
    return view
  }
  
  func updateUIView(_ uiView: UIView, context: Context) {
    
  }
}
