//
//  Hole1View.swift
//  DiscGolfRB
//
//  Created by Breshears, Rob - CTC on 10/23/25.
//

import SwiftUI
import MapKit

struct Hole1View: View {
    
//    @Binding var score: Int
    @Environment(\.dismiss) var dismiss
    @Environment(\.score) var score
    
    var body: some View {
        VStack {
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
            
            Text("\(score)")
            
            Button {
                dismiss()
            } label: {
                Text("Submit Score")
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity   )
        .background(.ultraThinMaterial)

    }
}

#Preview {
    Hole1View()
}
