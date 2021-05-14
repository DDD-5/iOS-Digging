//
//  SettingAppSuggestionView.swift
//  Digging
//
//  Created by Gisu Hwang on 2021/05/14.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct SettingAppSuggestionView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

	var body: some View {

		List {
			VStack {
				HStack {
					Text("""
						안녕하세요. 디깅 서비스를 운영하는 오레오입니다.
						문의사항 또는 건의 사항이 있으시면 아래 이메일로
						연락 부탁드립니다.
						""")
						.modifier(
							DiggingFont(type: .regular, size: 14)
						)
						.frame(alignment: .leading)
						.padding()

					Spacer()
				}
				HStack {
					Text("💌 ddd.digging@gmail.com")
						.modifier(
							DiggingFont(type: .bold, size: 14)
						)
						.frame(alignment: .leading)
						.padding()

					Spacer()
					Button(action: {}, label: {
						Text("보내기")
					})
				}
			}

			VStack {
				HStack {
					Text("🤝 함께 만든 사람들")
						.modifier(
							DiggingFont(type: .medium, size: 14)
						)
						.frame(alignment: .leading)
						.padding()

					Spacer()
				}
				HStack {
					Text("황재욱, 황기수, 배인경, 최지연, 문예원")
						.modifier(
							DiggingFont(type: .bold, size: 14)
						)
						.frame(alignment: .leading)
						.padding()

					Spacer()

				}
			}

		}
		.navigationBarBackButtonHidden(true)
		.navigationBarTitle("앱 문의/건의", displayMode: .inline)
		.navigationBarItems(leading:
								Button(action: {
									self.presentationMode.wrappedValue.dismiss()
								}, label: {
									Image("back_btn_img")
								})
		)

	}
}

struct SettingAppSuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        SettingAppSuggestionView()
    }
}
