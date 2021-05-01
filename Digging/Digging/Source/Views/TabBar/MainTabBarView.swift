//
//  MainTabBarView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/04.
//

import SwiftUI
import BottomSheet

struct MainTabBarView: View {
	// TODO: 현재 로그인뷰 테스트를 위한 임시 뷰모델로 변경예정
	@ObservedObject private var viewModel = MainTabBarViewModel(initialIndex: 1, customItemIndex: 2)
	
	var body: some View {
		ZStack {
			TabView(selection: $viewModel.itemSelected) {
				MainIdeaStorageView()
					.tabItem {
						Image("tabbar_main_idea_storage")
						Text("보관함")
					}
					.tag(1)
				
				MyDiggingView()
					.tabItem {
						Image("tabbar_create_digging")
						Text("디깅")
					}
					.tag(2)
				
				SearchDiggingView()
					.tabItem {
						Image("tabbar_search_digging")
						Text("검색")
					}
					.tag(3)
				
				MyDiggingView()
					.tabItem {
						Image("tabbar_my_digging")
						Text("마이 디깅")
					}
					.tag(4)
			}
			.accentColor(.black)
			.bottomSheet(
					isPresented: $viewModel.isCustomItemSelected,
					height: 300,
					topBarHeight: 16,
					topBarCornerRadius: 16,
					showTopIndicator: false
			) {
				LoginView()
			}
		}
	}
}
struct MainTabBarView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabBarView()
  }
}
