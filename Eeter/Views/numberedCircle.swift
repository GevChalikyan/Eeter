//
//  SwiftUIView.swift
//  Eeter
//
//  Created by Gev Chalikyan on 12/8/23.
//

import SwiftUI

var numberedCircle: some View {
	
	
	return ZStack() {
		Circle()
			.fill(Color.white)
		
		Text(1.)
			.font(.largeTitle)
	}
}

#Preview {
    numberedCircle
}
