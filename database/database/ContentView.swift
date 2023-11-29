//
//  ContentView.swift
//  database
//
//  Created by jason gungormezer on 11/22/23.
//

import SwiftUI

enum ActivityLevel: String, CaseIterable {
    case sedentary = "Sedentary"
    case lightlyActive = "Lightly Active"
    case moderatelyActive = "Moderately Active"
    case veryActive = "Very Active"
}

struct ContentView: View {
    @State private var currentWeight: String = UserDefaults.standard.string(forKey: "currentWeight") ?? ""
    @State private var goalWeight: String = UserDefaults.standard.string(forKey: "goalWeight") ?? ""
    @State private var calorieInput: String = UserDefaults.standard.string(forKey: "calorieInput") ?? ""
    @State private var selectedActivityLevel: ActivityLevel = ActivityLevel(rawValue: UserDefaults.standard.string(forKey: "selectedActivityLevel") ?? "") ?? .sedentary

    @State private var isDisplayingInfo: Bool = false
    @State private var isConfirmationPromptVisible: Bool = false

    var body: some View {
        VStack {
            Text("Weight and Calorie Tracker")
                .font(.largeTitle)
                .padding()

            TextField("Enter current weight (lbs)", text: $currentWeight)
                .keyboardType(.numberPad)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Enter goal weight (lbs)", text: $goalWeight)
                .keyboardType(.numberPad)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Enter daily calories", text: $calorieInput)
                .keyboardType(.numberPad)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Picker("Select activity level", selection: $selectedActivityLevel) {
                ForEach(ActivityLevel.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Button("Submit") {
                saveUserInput()
                withAnimation {
                    isDisplayingInfo.toggle()
                    isConfirmationPromptVisible.toggle()
                }
            }
            .padding()

            if isDisplayingInfo {
                UserInformationView(currentWeight: currentWeight, goalWeight: goalWeight, calorieInput: calorieInput, activityLevel: selectedActivityLevel)

                if isConfirmationPromptVisible {
                    ConfirmationPromptView(yesAction: {
                        isConfirmationPromptVisible = false
                    }, noAction: {
                        clearForm()
                        isConfirmationPromptVisible = false
                    })
                    .transition(.opacity)
                    .animation(.easeInOut)
                    .padding()
                }
            }

            Spacer()
        }
        .padding()
    }

    func saveUserInput() {
        UserDefaults.standard.set(currentWeight, forKey: "currentWeight")
        UserDefaults.standard.set(goalWeight, forKey: "goalWeight")
        UserDefaults.standard.set(calorieInput, forKey: "calorieInput")
        UserDefaults.standard.set(selectedActivityLevel.rawValue, forKey: "selectedActivityLevel")
    }

    func clearForm() {
        currentWeight = ""
        goalWeight = ""
        calorieInput = ""
        selectedActivityLevel = .sedentary
    }
}

struct UserInformationView: View {
    var currentWeight: String
    var goalWeight: String
    var calorieInput: String
    var activityLevel: ActivityLevel

    var body: some View {
        VStack {
            Text("User Information:")
                .font(.headline)
                .padding()

            Text("Current Weight: \(currentWeight) lbs")
                .fixedSize(horizontal: false, vertical: true)
                .padding()

            Text("Goal Weight: \(goalWeight) lbs")
                .fixedSize(horizontal: false, vertical: true)
                .padding()

            Text("Daily Calories: \(calorieInput)")
                .fixedSize(horizontal: false, vertical: true)
                .padding()

            Text("Activity Level: \(activityLevel.rawValue)")
                .fixedSize(horizontal: false, vertical: true)
                .padding()
        }
        .background(Color.green.opacity(0.3))
        .cornerRadius(10)
        .padding()
    }
}

struct ConfirmationPromptView: View {
    var yesAction: () -> Void
    var noAction: () -> Void

    var body: some View {
        VStack {
            Text("Does everything look good?")
                .font(.headline)
                .padding()

            HStack {
                Button("Yes") {
                    yesAction()
                }
                .padding()

                Button("No") {
                    noAction()
                }
                .padding()
            }
            .transition(.opacity)
            .animation(.easeInOut)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
