//
//  CalculateButton.swift
//  KPSS Puan Hesapla
//
//  Created by AHMET HAKAN YILDIRIM on 17.11.2024.
//

import SwiftUI

struct CalculateButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
            
        }, label: {
            Label(title, systemImage: "plus.forwardslash.minus")
                .font(.title)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
            
        })
        .buttonStyle(.borderedProminent)
        .tint(.blue)
    }
}

#Preview {
    CalculateButton(title: "Hesapla", action: {
        print("KPSS Puan Hesaplama Uygulaması")
    })
}
