//
//  MainTabBarView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/04.
//

import SwiftUI

struct MainTabBarView: View {
  var body: some View {
    TabView {
      MainIdeaStorageView()
        .tabItem {
          Text("보관함")
        }
    }
  }
}

struct MainTabBarView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabBarView()
  }
}
