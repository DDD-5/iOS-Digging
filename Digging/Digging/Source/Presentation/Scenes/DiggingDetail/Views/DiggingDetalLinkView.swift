//
//  DiggingDetalLinkView.swift
//  Digging
//
//  Created by GisuHwang on 2021/05/23.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct DiggingDetalLinkView: View {
	var linkURL: String
	
	var body: some View {
		Link(destination: URL(string: linkURL)!, label: {
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
        DiggingDetalLinkView(linkURL: "linkURL")
    }
}
