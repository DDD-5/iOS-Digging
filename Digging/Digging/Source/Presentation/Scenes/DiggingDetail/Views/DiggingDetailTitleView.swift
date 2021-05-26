//
//  DiggingDetailTitleView.swift
//  Digging
//
//  Created by GisuHwang on 2021/05/23.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct DiggingDetailTitleView: View {
	
	var title: String
	var date: String
	var body: some View {
		VStack {
			// Title Area
			Text(title)
				.modifier(
					DiggingFont(type: .bold, size: 24)
				)
				.frame(maxWidth: .infinity, alignment: .topLeading)
				.padding(.leading, 20)
				.padding(.bottom, 8)
			
			// Date Area
			Text(date)
				.modifier(
					DiggingFont(type: .regular, size: 13)
				)
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(.leading, 20)
				.foregroundColor(.lightGray)
			
			
			
		}
	}
}
struct DiggingDetailTitleView_Previews: PreviewProvider {
		static var previews: some View {
			DiggingDetailTitleView(title: "title", date: "2021.05")
		}
}
