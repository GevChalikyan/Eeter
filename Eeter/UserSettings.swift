//
//  UserSettings.swift
//  Eeter
//
//  Created by Gev Chalikyan on 11/17/23.
//

import Foundation
import SwiftData

enum Goal {
	case cut
	case maintain
	case bulk
}

@Model
final class UserSettings {
	private(set) var goal: Goal
	private(set) var heightFeet: Int
	private(set) var heightInches: Int
	private(set) var weightInPounds: Int
	
	init(goal: Goal, heightFeet: Int, heightInches: Int, weightInPounds: Int) {
		self.goal = goal
		self.heightFeet = heightFeet
		self.heightInches = heightInches
		self.weightInPounds = weightInPounds
	}
}
