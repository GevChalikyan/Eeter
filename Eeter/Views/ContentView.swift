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
	@Namespace var addFoodItemAnimation
	@State var isFoodItemBeingAdded = false
	@State var isTransitionComplete = false
	
	let animationTime = 1.5
	
	var body: some View {
		if(isFoodItemBeingAdded) {
			addFoodItemView
				.transition(.scale(1.0))
		}
		else {
			homeView
				.transition(.scale(1.0))
		}
	}
	
	var homeView: some View {
		VStack() {
			Circle()
				.fill(Color.white)
				.shadow(radius: 30.0)
				.frame(width: 350.0, height: 350.0)
			
			
			ZStack() {
				Circle()
					.fill(Color.blue)
					.shadow(radius: 5.0)
					.matchedGeometryEffect(id: "Button", in: addFoodItemAnimation)
					.frame(width: 120.0, height: 120.0)
				
				Button {
					withAnimation(.easeInOut(duration: animationTime)) {
						isFoodItemBeingAdded.toggle()
					}
				} label: {
					Image(systemName: "plus")
						.resizable()
						.matchedGeometryEffect(id: "Button Label", in: addFoodItemAnimation)
						.frame(width: 75.0, height: 75.0)
				}
				.foregroundStyle(Color.white)
			}
			.padding(.all, 20.0)
			.padding(.top, 30.0)
		
			
			
			Spacer()
		}
	}
	
	var addFoodItemView: some View {
		ZStack() {
			VStack() {
				Circle()
					.fill(Color.white)
					.shadow(radius: 30.0)
					.frame(width: 350.0, height: 350.0)
				
				Spacer()
			}
			Color(.blue)
				.clipShape(Circle())
				.aspectRatio(contentMode: .fill)
				.matchedGeometryEffect(id: "Button", in: addFoodItemAnimation)
				.onTapGesture {
					withAnimation(.spring(duration: animationTime)) {
						isFoodItemBeingAdded.toggle()
					}
				}
			Image(systemName: "plus")
				.resizable()
				.matchedGeometryEffect(id: "Button Label", in: addFoodItemAnimation)
				.frame(width: 0.01, height: 0.01)
				.foregroundStyle(Color.white)
		}
	}
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
