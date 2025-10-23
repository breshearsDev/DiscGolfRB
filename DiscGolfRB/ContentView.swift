//
//  ContentView.swift
//  DiscGolfRB
//
//  Created by Breshears, Rob - CTC on 10/22/25.
//

import SwiftUI
import MapKit

extension EnvironmentValues {
    @Entry var score: Int = 0
}

struct ContentView: View {
    
    @State var isPresented: Bool = false
    //@State var score: Int = 0
    
    let homelocation = CLLocationCoordinate2D(latitude: 40.558546389890125, longitude: -105.13681073304909)
    
    @State var holes: [Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]
    
    let latTee: [Double] = []
    let longTee: [Double] = []
    let latBskt: [Double] = []
    let longBskt: [Double] = []
    
    @State var camera: MapCameraPosition = .automatic
    
    var body: some View {
        VStack {
            
            Spacer()
            Text("Aggie Greens Disc Golf")
                .font(.largeTitle)
            Map(position: $camera) {
                Marker(coordinate: homelocation, label: { Text("Aggie Greens") })
            }
            .mapStyle(.imagery)
                
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
            .fullScreenCover(isPresented: $isPresented) {
                Hole1View()
                    
            }
        }

    }
}

#Preview {
    ContentView()
}
