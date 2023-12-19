//
//  Item.swift
//  Eeter
//
//  Created by Gev Chalikyan on 11/17/23.
//

import Foundation
import SwiftData

@Model
final class Item: Identifiable {
	
	var id: String
	var data: CGFloat
    var timestamp: Date
    
	init(data: CGFloat, timestamp: Date) {
		self.id = UUID().uuidString
		self.data = data
        self.timestamp = timestamp
    }
}
