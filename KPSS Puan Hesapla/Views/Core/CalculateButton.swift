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
            Text(title)
                .bold()
                .font(.title2)
                .padding(10)
                .frame(maxWidth: .infinity)
            
        })
        .buttonStyle(.borderedProminent)
        .tint(.main)
    }
}

#Preview {
    CalculateButton(title: "", action: {
        print("KPSS Puan Hesaplama Uygulaması")
    })
}
