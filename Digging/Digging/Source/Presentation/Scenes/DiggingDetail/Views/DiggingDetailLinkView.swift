//
//  DiggingDetalLinkView.swift
//  Digging
//
//  Created by GisuHwang on 2021/05/23.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct DiggingDetailLinkView: View {
	var linkURL: String
	
	var body: some View {
		// TODO: 기본값 google 제거 예정
		Link(destination: URL(string: linkURL) ?? URL(string: "https://www.google.com")!, label: {
			Text(linkURL)
				.underline()
				
				.modifier(
					DiggingFont(type: .regular, size: 14)
				)
				.frame(maxWidth: .infinity, alignment: .topLeading)
				.foregroundColor(.cardDarkGray)
				.padding()
		})
	}
}

struct DiggingDetalLinkView_Previews: PreviewProvider {
    static var previews: some View {
        DiggingDetailLinkView(linkURL: "linkURL")
    }
}
