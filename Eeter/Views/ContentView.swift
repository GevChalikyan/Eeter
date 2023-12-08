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
	@Namespace var _transitionViewA
	
	@State private var percent = 0.0
	@State private var firstWaveOffset = Angle(degrees: 0)
	@State private var secondWaveOffset = Angle(degrees: 60)
	
	@State var isBackgroundBlue: Bool = false
	@State var isPlusSignVisible: Bool = true
	@State var isVisible_addFoodItemView: Bool = true
	@State var isFrameOversized: Bool = false
	
	@State var isFoodItemBeingAdded: Bool = false
	@State var isTransitionComplete: Bool = false
	@State var isFoodItemAdded: Bool = false
	
	let animationTime: CGFloat = 1.5
	
	let upperCircleSize: CGFloat = 350.0
	let upperCircleShadowRadius: CGFloat = 30.0
	let upperCircleX: CGFloat = UIScreen.main.bounds.width / 2.0
	let upperCircleY: CGFloat = 200.0
	
	let lowerCircleSize: CGFloat = 120.0
	let lowerCircleShadowRadius: CGFloat = 10.0
	let lowerCircleX: CGFloat = UIScreen.main.bounds.width / 2.0
	let lowerCircleY: CGFloat = 650.0
	let lowerCircleSizeModifier: CGFloat = 3.0
	
	var body: some View {
		ZStack() {
			upperCircleView
			
			if(isBackgroundBlue) {
				Color(.blue)
					.ignoresSafeArea(.all)
			}
			
			if(isFoodItemAdded) {
				transitionViewB
					.transition(.scale(1.0))
			}
			else if(isFoodItemBeingAdded && isTransitionComplete) {
				addFoodItemView
			}
			else if(isFoodItemBeingAdded) {
				transitionViewA
					.transition(.scale(1.0))
			}
			else {
				lowerCircleView
			}
		}
	}
	
	var fullScreenBlueCircle: some View {
		
		
		return Circle()
			.fill(Color.blue)
			.matchedGeometryEffect(id: "Button", in: _transitionViewA)
			.frame(width: UIScreen.main.bounds.width * lowerCircleSizeModifier, height: UIScreen.main.bounds.width * lowerCircleSizeModifier)
			.ignoresSafeArea()
	}
	
	var upperCircleView: some View {
		
		
		return ZStack() {
			Circle()
				   .fill(Color.white)
				   .shadow(radius: upperCircleShadowRadius)
			   
			   Wave(offSet: Angle(degrees: firstWaveOffset.degrees), percent: percent)
				   .fill(Color.blue)
				   .clipShape(Circle())
			   Wave(offSet: Angle(degrees: secondWaveOffset.degrees), percent: percent)
				   .fill(Color.cyan)
				   .opacity(0.8)
				   .clipShape(Circle())
		   }
		   .frame(width: upperCircleSize, height: upperCircleSize)
		   .position(x: isFrameOversized ? upperCircleX * lowerCircleSizeModifier : upperCircleX, y: isFrameOversized ? upperCircleY + 210.0 : upperCircleY)
		   .onAppear {
			   withAnimation(.linear(duration: animationTime).repeatForever(autoreverses: false)) {
				   firstWaveOffset += Angle(degrees: 360)
			   }
			   withAnimation(.linear(duration: (animationTime * 2.0) + 0.1).repeatForever(autoreverses: false)) {
				   secondWaveOffset += Angle(degrees: 360)
			   }
		   }
	}
	
	var lowerCircleView: some View {
		
		
		return ZStack() {
				Circle()
					.fill(Color.blue)
					.shadow(radius: lowerCircleShadowRadius)
					.matchedGeometryEffect(id: "Button", in: _transitionViewA)
					.frame(width: lowerCircleSize, height: lowerCircleSize)
				
				Button {
					withAnimation(.easeInOut(duration: animationTime / 2.0)) {
						isPlusSignVisible = false
					} completion: {
						withAnimation(.easeInOut(duration: animationTime)) {
							isFrameOversized = true
							isFoodItemBeingAdded = true
						}
					}
				} label: {
					Image(systemName: "plus")
						.resizable()
						.frame(width: lowerCircleSize - 45.0, height: lowerCircleSize - 45.0)
						.shadow(radius: lowerCircleShadowRadius)
						.opacity(isPlusSignVisible ? 1.0 : 0.0)
				}
				.foregroundStyle(Color.white)
			}
			.position(x: lowerCircleX, y: lowerCircleY)
	}
	
	var transitionViewA: some View {
		
		
		return fullScreenBlueCircle
			.onAppear() {
				Timer.scheduledTimer(withTimeInterval: animationTime, repeats: false) { (_) in
					isBackgroundBlue = true
					
					withAnimation {
						isTransitionComplete = true
					}
				}
			}
	}
	
	var transitionViewB: some View {
		
		
		return fullScreenBlueCircle
			.onAppear() {
				isBackgroundBlue = false
				
				withAnimation(.easeInOut(duration: animationTime)) {
					isTransitionComplete = false
					isFoodItemBeingAdded = false
					isFoodItemAdded = false
					isFrameOversized = false
				}
			}
	}
	
	var addFoodItemView: some View {
		
		
		return ZStack() {
			//
			//	FIXME: Placeholder text
			//
			VStack() {
				Button() {
					withAnimation(.easeInOut(duration: animationTime / 2.0)) {
						isVisible_addFoodItemView = false
					} completion: {
						withAnimation(.easeInOut(duration: animationTime)) {
							isFoodItemAdded = true
						}
						Timer.scheduledTimer(withTimeInterval: animationTime, repeats: false) { (_) in
							withAnimation {
								isPlusSignVisible = true
							}
						}
					}
				} label: {
					Image(systemName: "plus")
						.resizable()
						.frame(width: lowerCircleSize - 45.0, height: lowerCircleSize - 45.0)
						.shadow(radius: lowerCircleShadowRadius)
						
				}
				.foregroundStyle(Color.white)
			}
			.opacity(isVisible_addFoodItemView ? 1.0 : 0.0)
			
		}
	}
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
