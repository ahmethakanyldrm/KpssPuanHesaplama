//
//  SecondaryEducationView.swift
//  KPSS Puan Hesapla
//
//  Created by AHMET HAKAN YILDIRIM on 17.11.2024.
//

import SwiftUI

// Ortaöğretim
struct SecondaryEducationView: View {
    @State private var gkTrueCount: Double = 60
    @State private var gkFalseCount: Double = 0
    
    @State private var gyTrueCount: Double = 30
    @State private var gyFalseCount: Double = 0
    
    @State private var result: Double = 0
    
    var body: some View {
        VStack {
            
            Form {
                Section {
                    Stepper("Doğru Sayısı: \(gkTrueCount, specifier: "%.0f")", value: $gkTrueCount, in: 1...60)
                        .sensoryFeedback(.selection, trigger: gkTrueCount)
                    Stepper("Yanlış Sayısı: \(gkFalseCount, specifier: "%.0f")", value: $gkFalseCount, in: 0...60)
                        .sensoryFeedback(.selection, trigger: gkFalseCount)
                    
                } header: {
                    Text("Genel Kültür")
                        .textCase(.none)
                }footer: {
                    if(gkTrueCount + gkFalseCount > 60) {
                        Text("Toplam doğru ve yanlış sayıları 60'ı geçemez")
                            .foregroundStyle(.red)
                    }
                }
                
                Section {
                    Stepper("Doğru Sayısı: \(gyTrueCount, specifier: "%.0f")", value: $gyTrueCount, in: 1...60)
                        .sensoryFeedback(.selection, trigger: gyTrueCount)
                    Stepper("Yanlış Sayısı: \(gyFalseCount, specifier: "%.0f")", value: $gyFalseCount, in: 0...60)
                        .sensoryFeedback(.selection, trigger: gyFalseCount)
                    
                } header: {
                    Text("Genel Yetenek")
                        .textCase(.none)
                }footer: {
                    if(gyTrueCount + gyFalseCount > 60) {
                        Text("Toplam doğru ve yanlış sayıları 60'ı geçemez")
                            .foregroundStyle(.red)
                    }
                }
                
                Section {
                    Text("KPSS Puanı: \(result, specifier: "%.3f")")
                    
                    CalculateButton(title: "Hesapla") {
                        // genel kültür ve genel yetenek netlerimizi hesaplıyoruz
                        
                        let gkNet = gkTrueCount - (gkFalseCount / 4)
                        let gyNet = gyTrueCount - (gyFalseCount / 4)
                        
                        result = 55.839 + gyNet * 0.348 + gkNet * 0.431
                        
                    }
                    .disabled(formControl)
                    
                    
                } header: {
                    Text("Sonuç")
                        .textCase(.none)
                }
            }
        }
        .navigationTitle("Ortaöğretim")
    }
    
    
    var formControl: Bool {
        if((gyTrueCount + gyFalseCount) > 60 || (gkTrueCount + gkFalseCount) > 60) {
           return true
        }
        return false
    }
    
}

#Preview {
    SecondaryEducationView()
}
