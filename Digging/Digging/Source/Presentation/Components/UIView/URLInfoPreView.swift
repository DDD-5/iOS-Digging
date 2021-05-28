//
//  URLInfoPreView.swift
//  Digging
//
//  Created by 황재욱 on 2021/05/28.
//  Copyright © 2021 Oreo. All rights reserved.
//

import LinkPresentation
import SwiftUI
import UIKit

struct URLInfoPreView: UIViewRepresentable {
  
  let url: URL
  
  let provider = LPMetadataProvider()
  
  @Binding var redraw: Bool
  
  func makeUIView(context: Context) -> UIView {
    let view = UIView()
    let linkView = LPLinkView(url: url)
    view.addSubview(linkView)
    linkView.translatesAutoresizingMaskIntoConstraints = false
    provider.startFetchingMetadata(for: url) { metaData, error in
      guard
          let metaData = metaData,
          error == nil
          else {
        return
      }
      
      DispatchQueue.main.async {
        linkView.metadata = metaData
        linkView.sizeToFit()
        redraw.toggle()
      }
    }
    
    NSLayoutConstraint.activate([
      linkView.widthAnchor.constraint(equalTo: view.widthAnchor),
      linkView.heightAnchor.constraint(equalTo: view.heightAnchor)
    ])
    
    return view
  }
  
  func updateUIView(
    _ uiView: UIView,
    context: Context
  ) {
  }
}
