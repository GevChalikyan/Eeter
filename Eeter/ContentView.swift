//
//  ContentView.swift
//  Eeter
//
//  Created by Gev Chalikyan on 11/17/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
//
//   var body: some View {
//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
	@State private var percent = 0.0
	@State private var firstWaveOffset = Angle(degrees: 0)
	@State private var secondWaveOffset = Angle(degrees: 60)
	
	
	
	var body: some View {
		VStack() {
			ZStack() {
				Circle()
					.fill(Color.white)
					.shadow(radius: 30.0)
					
				Wave(offSet: Angle(degrees: firstWaveOffset.degrees), percent: percent)
					.fill(Color.blue)
					.clipShape(Circle())
				Wave(offSet: Angle(degrees: secondWaveOffset.degrees), percent: percent)
					.fill(Color.cyan)
					.opacity(0.8)
					.clipShape(Circle())
			}
			.frame(width: 350, height: 350)
			.padding(.top, 50.0)
			
			Button {
				/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
			} label: {
				Image(systemName: "plus")
					.resizable()
					.frame(width: 100.0, height: 100.0)
			}
			.padding(.all, 20.0)
			.background(Color.blue)
			.foregroundStyle(Color.white)
			.clipShape(Circle())
			.shadow(radius: 5.0)
			.padding(.top, 30.0)
		
			Spacer()
		}
	}
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
