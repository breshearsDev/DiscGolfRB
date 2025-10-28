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
    
    @State var scoreColor: Color = .blue
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hole 1")
                .font(.largeTitle)
            Map() {
               Marker("Hole 1", coordinate: CLLocationCoordinate2D(latitude: 40.5564509, longitude: -105.1390831))
                    .tint(.blue)
                Marker("Basket 1", systemImage: "flag.fill", coordinate: CLLocationCoordinate2D(latitude: 40.5565559, longitude: -105.1379600))
            }
            .mapStyle(.imagery)
            .frame(width: 800, height: 400)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            HStack {
                Text("318 ft")
                Text("Par 3")
            }
            .padding()
            
            HStack {
                Spacer()
                Stepper("score: \(hole1Score)", value: $hole1Score, in: 0...25)
                    .font(.largeTitle)
                    .frame(width: 300)
                    .foregroundStyle(hole1Score < 3 ? .green : (hole1Score == 3 ? .blue : .red))
                    .padding()
                    .background(.white)
                    .padding()
                
                Spacer()
            }
            Button {
                score += hole1Score
                dismiss()
//
            } label: {
                Text("Submit Score")
                
                    .padding()
                    .background(.white)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 20))
            }

        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity   )
        .background(.ultraThinMaterial)

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
