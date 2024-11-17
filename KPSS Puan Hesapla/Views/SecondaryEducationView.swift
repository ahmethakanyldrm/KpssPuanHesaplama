//
//  SecondaryEducationView.swift
//  KPSS Puan Hesapla
//
//  Created by AHMET HAKAN YILDIRIM on 17.11.2024.
//

import SwiftUI

// Ortaöğretim
struct SecondaryEducationView: View {
    @State private var gkTrueCount = 30
    @State private var gkFalseCount = 0
    
    @State private var gyTrueCount = 30
    @State private var gyFalseCount = 0
    
    @State private var result = 0
    
    var body: some View {
        VStack {
            
            Form {
                Section {
                    Stepper("Doğru Sayısı: \(gkTrueCount)", value: $gkTrueCount, in: 1...60)
                        .sensoryFeedback(.selection, trigger: gkTrueCount)
                    Stepper("Yanlış Sayısı: \(gkFalseCount)", value: $gkFalseCount, in: 1...60)
                        .sensoryFeedback(.selection, trigger: gkFalseCount)
                    
                } header: {
                    Text("Genel Kültür")
                        .textCase(.none)
                }
                
                Section {
                    Stepper("Doğru Sayısı: \(gyTrueCount)", value: $gyTrueCount, in: 1...60)
                        .sensoryFeedback(.selection, trigger: gyTrueCount)
                    Stepper("Yanlış Sayısı: \(gyFalseCount)", value: $gyFalseCount, in: 1...60)
                        .sensoryFeedback(.selection, trigger: gyFalseCount)
                    
                } header: {
                    Text("Genel Yetenek")
                        .textCase(.none)
                }
                
                Section {
                    Text("KPSS Puanı: \(result)")
                    
                    CalculateButton(title: "Hesapla") {
                        
                    }
                    
                    
                } header: {
                    Text("Sonuç")
                        .textCase(.none)
                }
            }
        }
        .navigationTitle("Ortaöğretim")
    }
}

#Preview {
    SecondaryEducationView()
}
