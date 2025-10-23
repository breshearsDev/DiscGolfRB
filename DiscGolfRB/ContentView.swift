//
//  ContentView.swift
//  DiscGolfRB
//
//  Created by Breshears, Rob - CTC on 10/22/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State var isPresented: Bool = false
    
    @State var holes: [Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]
    
    var body: some View {
        VStack {
            
            Spacer()
            Text("Aggie Greens Disc Golf")
                .font(.largeTitle)
            Map()
                
//            List(holes, id: \.self) { hole in
//                Text("Hole \(hole)")
//            }
            ScrollView(.horizontal) {
                HStack {
                    ForEach(1...18, id: \.self) { hole in
                        Button {
                            self.isPresented.toggle()
                        } label: {
                            Text("Hole \(hole)")
                                .frame(width: 100, height: 100)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(50)
                        }
                    }
                }
                .padding()
                .background(.thinMaterial)
            }
            
            .scrollTargetBehavior(.paging)
            .sheet(isPresented: $isPresented) {
                Text("Sheet Content")
            }
        }

    }
}

#Preview {
    ContentView()
}
