//
//  ContentView.swift
//  GeMO
//
//  Created by Denise Pacheco on 11/25/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(.white).ignoresSafeArea()
            VStack {
                Text("Calorie Calculator")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(1.5)
                Text("Please enter the necessary infomation down below").font(.system(size: 20))
                    .lineSpacing(10.0)
                Spacer()
                Text("What is your biological sex?")
                    .font(.title)
                HStack {
                    Spacer()
                    Button("Button") {
                                            
                                        }
                    Text("Male")
                    Spacer()
                    Button("Button") {
                                            
                                        }
                    Text("Female")
                    Spacer()
                }
                Spacer()
                
                Text("Weight (in lbs)").font(.title).fontWeight(.semibold).multilineTextAlignment(.leading).padding(.trailing, 170.0)
                TextField("Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(""))
                    .cornerRadius(10)
                Text("Height (in inches)")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.trailing, 180.0)
                TextField("placeholder", text: .constant(""))
                Text("Age")
                    .font(.title)
                    .fontWeight(.semibold)
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                Spacer()
                Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
