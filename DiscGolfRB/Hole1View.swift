//
//  Hole1View.swift
//  DiscGolfRB
//
//  Created by Breshears, Rob - CTC on 10/23/25.
//

import SwiftUI
import MapKit

struct Hole1View: View {
    
    
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var score: Int
    
    @State var hole1Score = 0
    
    @State var scoreColor: Color = .gray
    
    var body: some View {
        VStack {
            
            Map() {
                Marker("Hole 1", coordinate: CLLocationCoordinate2D(latitude: 40.5564509, longitude: -105.1390831))
                    .tint(.blue)
                Marker("Basket 1", systemImage: "flag.fill", coordinate: CLLocationCoordinate2D(latitude: 40.5565559, longitude: -105.1379600))
            }
            .mapStyle(.imagery)
            .frame(width: 800, height: 400)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
            VStack {
                VStack(alignment: .leading) {
                    
                    Text("Hole 1")
                        .font(.system(size: 80))
                    HStack {
                        Image(systemName: "flag.fill")
                        Text("318 ft")
                            .font(.largeTitle)
                            .foregroundStyle(.gray)
                        Text("Par 3")
                            .font(.largeTitle)
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                }
                Circle()
                    .fill(scoreColor)
                    .stroke(.white, lineWidth: 4)
                    .shadow(radius: 7)
                    .frame(width: 200, height: 200)
                    .overlay {
                        Text("\(hole1Score)")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        
                    }
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        hole1Score -= 1
                        colorCode()
                    } label: {
                        Capsule()
                            .stroke(.blue, lineWidth: 4)
                            .frame(width: 300, height: 100)
                            .overlay(
                                Text("-1")
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundStyle(.blue)
                            )
                    }
                    
                    Spacer()
                    Button {
                        hole1Score += 1
                        colorCode()
                    } label: {
                        Capsule()
                            .stroke(.blue, lineWidth: 4)
                            .frame(width: 300, height: 100)
                            .overlay(
                                Text("+1")
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundStyle(.blue)
                            )
                    }
                    Spacer()
                    
                }
                Spacer()
                
                HStack {
                    Spacer()
                    Button {
                        score += hole1Score
                        dismiss()
                        //
                    } label: {
                        Text("Submit Score")
                        
                            .padding()
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 20))
                    }
                    Spacer()
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        
        }
    }
    func colorCode() {
        if hole1Score == 3 {
            scoreColor = .blue
        } else if hole1Score < 3 {
            scoreColor = .green
        } else {
            scoreColor = .red
        }
    }
}

#Preview {
    @Previewable @State var score = 0
    Hole1View(score: $score)
}
