//
//  NumberedCircle.swift
//  Eeter
//
//  Created by Gev Chalikyan on 12/8/23.
//

import SwiftUI

func NumberedCircle(num: Int = 0) -> some View {
	let circleDiameter: CGFloat = 100.0
	let circleShadowRadius: CGFloat = 5.0
	
	return ZStack() {
		Circle()
			.fill(Color.white)
			.shadow(radius: circleShadowRadius)
		
		Text("\(num)")
			.font(.largeTitle)
			.fontWeight(.bold)
	}
	.frame(width: circleDiameter, height: circleDiameter)
}

#Preview {
    NumberedCircle()
}
