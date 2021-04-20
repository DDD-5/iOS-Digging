//
//  MainTabBarView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/04.
//

import SwiftUI

struct SheetPresenter<Content>: View where Content: View {
  @Binding var presentingSheet: Bool
  var content: Content
  var body: some View {
    Text("")
      .sheet(isPresented: self.$presentingSheet, content: { self.content })
      .onAppear {
        DispatchQueue.main.async {
          self.presentingSheet = true
        }
      }
  }
}

struct MainTabBarView: View {
  @State var newListingPresented = false
  
  var body: some View {
    NavigationView {
      TabView {
        MainIdeaStorageView()
          .tabItem {
            Image("tabbar_main_idea_storage")
            Text("보관함")
          }.tag(1)
        
        SheetPresenter(presentingSheet: $newListingPresented, content: MyDiggingView())
          .tabItem {
            Image("tabbar_create_digging")
            Text("디깅")
          }
          .tag(2)
        /*MyDiggingView()
         .tabItem {
         Image("tabbar_create_digging")
         Text("디깅")
         }*/
        SearchDiggingView()
          .tabItem {
            Image("tabbar_search_digging")
            Text("검색")
          }.tag(3)
        MyDiggingView()
          .tabItem {
            Image("tabbar_my_digging")
            Text("마이 디깅")
          }.tag(4)
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
