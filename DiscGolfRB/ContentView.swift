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
    
    @State var holeNumber: Int = 1
    
    @State var score: Int = 0
    
    @State var homelocation = CLLocationCoordinate2D(latitude: 40.558546389890125, longitude: -105.13681073304909)
    
    @State var holes: [Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]
    
    let latTee: [Double] = []
    let longTee: [Double] = []
    let latBskt: [Double] = []
    let longBskt: [Double] = []
    
    @State var camera: MapCameraPosition = .automatic
    
    //@EnvironmentObject var scores: Score
    
    var body: some View {
        HStack {
            ScrollView {

                    ForEach(1...18, id: \.self) { hole in
                        Button {
                            self.isPresented.toggle()
                            holeNumber = hole
                            print(holeNumber)
                        } label: {
                            Text("Hole \(hole)")
                                .frame(width: 100, height: 100)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(50)
                        }
                        
                        
                }
                
            }
            .scrollBounceBehavior(.automatic)
            .scrollIndicators(.hidden)
            .padding()
            VStack {

                Text("Aggie Greens Disc Golf")
                    .font(.largeTitle)
                Map(position: $camera) {
                    Marker(coordinate: homelocation, label: { Text("Aggie Greens") })
                }
                .mapStyle(.hybrid)
                
                
                }
            .padding()
            
            }
        HStack {
            Button {
                camera = .region (MKCoordinateRegion(center: homelocation, latitudinalMeters: 300, longitudinalMeters: 300))
            } label: {
                Text("Full Map")
                    .font(.title)
            }
            

            Text("Total Score: \(score)")
        }
        .padding()
        .sheet(isPresented: $isPresented) {
            Hole1View(score: $score)
        }

    }
}

#Preview {
    ContentView()
        
}
