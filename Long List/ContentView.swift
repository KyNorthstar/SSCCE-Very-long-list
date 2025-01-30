//
//  ContentView.swift
//  Long List
//
//  Created by Ky on 2025-01-23.
//

import SwiftUI



private let defaultValue = 85
private let power: CGFloat = 1.05
private let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    return formatter
}()



struct ContentView: View {
    
    @State
    var itemCount: Int = defaultValue
    
    @State
    var sliderValue: CGFloat = .init(defaultValue)
    
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(1...itemCount, id: \.self) { itemNumber in
                        Text(formatter.string(from: itemNumber as NSNumber)!)
                            .id(itemNumber)
                    }
                }
            }
            
            Slider(value: $sliderValue, in: 1...400, step: 10) {
                Text("\(itemCount) items")
                    .font(.body.monospacedDigit())
                    .frame(minWidth: 120, alignment: .trailing)
            }
                .onChange(of: sliderValue) { oldValue, newValue in
                    itemCount = .init(sliderValueToItemCount(newValue))
                }
        }
        .padding()
    }
}



func sliderValueToItemCount(_ sliderValue: CGFloat) -> Int {
    .init(pow(power, sliderValue).rounded())
}


func itemCountToSliderValue(_ itemCount: Int) -> CGFloat {
    pow(1/power, .init(itemCount))
}



#Preview {
    ContentView()
}
