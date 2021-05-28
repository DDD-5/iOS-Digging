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
		NavigationView {
			ZStack {
				TabView(selection: $viewModel.itemSelected) {
					MainIdeaStorageView()
						.tabItem {
							Image(viewModel.itemSelected == 1 ? R.image.tabbar_main_idea_storage_select.name : R.image.tabbar_main_idea_storage_deselect.name)
							Text("보관함")
						}
						.tag(1)
					
					MyDiggingView()
						.tabItem {
							Image(viewModel.itemSelected == 2 ? R.image.tabbar_create_digging_select.name : R.image.tabbar_create_digging_deselect.name)
							Text("디깅")
						}
						.tag(2)
					
					SearchDiggingView()
						.tabItem {
							Image(viewModel.itemSelected == 3 ? R.image.tabbar_search_digging_select.name : R.image.tabbar_search_digging_deselect.name)
							Text("검색")
						}
						.tag(3)
					
					MyDiggingInfoView()
						.tabItem {
							Image(viewModel.itemSelected == 4 ? R.image.tabbar_my_digging_select.name : R.image.tabbar_my_digging_deselect.name)
							Text("마이 디깅")
						}
						.tag(4)
				}
				.accentColor(.black)
				.bottomSheet(
					isPresented: $viewModel.isCustomItemSelected,
					height: 350,
					topBarHeight: 16,
					topBarCornerRadius: 16,
					showTopIndicator: false
				) {
					// TODO: 비로그인시 로그인 바텀시트뷰 present
//					LoginView()
					SelectDiggingView()
				}
			}
		}
	}
}
struct MainTabBarView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabBarView()
  }
}
