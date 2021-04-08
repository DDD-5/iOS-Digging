//
//  MainTabBarView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/04.
//

import SwiftUI

struct MainTabBarView: View {
  var body: some View {
    NavigationView {
      TabView {
        MainIdeaStorageView()
          .tabItem {
            Image("tabbar_main_idea_storage")
            Text("보관함")
          }
        MyDiggingView()
          .tabItem {
          Image("tabbar_create_digging")
          Text("디깅")
        }
        SearchDiggingView()
          .tabItem {
            Image("tabbar_search_digging")
            Text("검색")
          }
        MyDiggingView()
          .tabItem {
            Image("tabbar_my_digging")
            Text("마이 디깅")
          }
      }
      .accentColor(.black)
    }
  }
}

struct MainTabBarView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabBarView()
  }
}
