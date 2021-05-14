//
//  SettingView.swift
//  Digging
//
//  Created by Gisu Hwang on 2021/05/13.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct SettingView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {

		List {
			SettingCategoryView(title: "내 프로필", image: R.image.right_calendar_arrow_img.name)
			NavigationLink(
				destination: SettingAppSuggestionView())
			{
				SettingCategoryView(title: "앱 문의/건의", image: "")
			}

			SettingCategoryView(title: "로그아웃", image: R.image.right_calendar_arrow_img.name)

			Text("현재 버전 1.0")
				.foregroundColor(.lightGray)
				.modifier(
					DiggingFont(type: .regular, size: 14)
				)
				.frame(alignment: .leading)
				.padding()

		}
		.navigationBarBackButtonHidden(true)
				.navigationBarTitle("설정", displayMode: .inline)
				.navigationBarItems(leading:
										Button(action: {
											self.presentationMode.wrappedValue.dismiss()
										}, label: {
											Image("back_btn_img")
										})
				)
		
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}


struct SettingCategoryView: View {

	var title: String
	var image: String

	private var isEmptyImage: Bool {
		return image.isEmpty
	}

	var body: some View {
		HStack {

			Text(title)
				.modifier(
					DiggingFont(type: .regular, size: 14)
				)
				.frame(alignment: .leading)

			if !isEmptyImage {
				Spacer()
				Image(systemName: "chevron.right")
					.frame(width: 24, height: 24)


			}

		}.padding()
	}
}
struct SettingCategoryView_Previews: PreviewProvider {
	static var previews: some View {
		SettingCategoryView(title: "text", image: R.image.right_calendar_arrow_img.name)
	}
}

