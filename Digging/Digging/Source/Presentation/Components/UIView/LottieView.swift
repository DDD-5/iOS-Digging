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
  
  var filename: String
  
  
  func makeUIView(context: Context) -> UIView {
    let lottieView = AnimationView(name: filename)
    lottieView.loopMode = .loop
    lottieView.play()
    lottieView.contentMode = .scaleAspectFit
    lottieView.translatesAutoresizingMaskIntoConstraints = false
    let view = UIView()
    
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
