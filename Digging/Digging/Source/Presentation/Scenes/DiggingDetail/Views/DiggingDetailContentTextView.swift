//
//  DiggingDetailContentTextView.swift
//  Digging
//
//  Created by GisuHwang on 2021/05/23.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct DiggingDetailContentTextView: View {
	var contentText: String
	var body: some View {
		
		Text(contentText)
			.modifier(
				DiggingFont(type: .regular, size: 14)
			)
			.frame(maxWidth: .infinity, alignment: .topLeading)
			.foregroundColor(.darkGray)
			.padding()
		
	}
}
struct DiggingDetailContentTextView_Previews: PreviewProvider {
		static var previews: some View {
			DiggingDetailContentTextView(contentText: "content Text")
		}
}
