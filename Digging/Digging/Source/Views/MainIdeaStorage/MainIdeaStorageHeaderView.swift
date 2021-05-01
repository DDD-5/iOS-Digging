//
//  MainIdeaStorageHeaderView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/08.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct MainIdeaStorageHeaderView: View {
  var title: String
  
  var body: some View {
    Text(title)
      .frame(width: UIScreen.main.bounds.width, height: 28, alignment: .topLeading)
      .padding(.leading, 20)
      .font(.custom("AppleSDGothicNeo-Bold", size: 16)
      )
  }
}

struct MainIdeaStorageHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    MainIdeaStorageHeaderView(title: "title")
  }
}
