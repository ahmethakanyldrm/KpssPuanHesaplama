//
//  LicenseView.swift
//  KPSS Puan Hesapla
//
//  Created by AHMET HAKAN YILDIRIM on 17.11.2024.
//

import SwiftUI

// Lisans
struct LicenseView: View {
    @State private var gkTrueCount: Double = 60
    @State private var gkFalseCount: Double = 0
    
    @State private var gyTrueCount: Double = 30
    @State private var gyFalseCount: Double = 0
    
    @State private var result2022: Double = 0
    @State private var result2023: Double = 0
    
    var body: some View {
        VStack {
            
            Form {
                Section {
                    Stepper(value: $gkTrueCount, in: 1...60) {
                        Label(
                            title: { Text("Doğru Sayısı: \(gkTrueCount, specifier: "%.0f")") },
                            icon: { Image(systemName: "checkmark.circle") }
)
                    }
                        .sensoryFeedback(.selection, trigger: gkTrueCount)
                        .bold()
                    Stepper(value: $gkFalseCount, in: 0...60) {
                        Label(
                            title: { Text("Yanlış Sayısı: \(gkFalseCount, specifier: "%.0f")") },
                            icon: { Image(systemName: "xmark.circle") }
                        )
                    }
                        .sensoryFeedback(.selection, trigger: gkFalseCount)
                        .bold()
                    
                } header: {
                    Text("Genel Kültür")
                        .foregroundStyle(.main)
                        .textCase(.none)
                }footer: {
                    if(gkTrueCount + gkFalseCount > 60) {
                        Text("Toplam doğru ve yanlış sayıları 60'ı geçemez")
                            .foregroundStyle(.red)
                    }
                }
                
                Section {
                    Stepper(value: $gyTrueCount, in: 1...60) {
                        Label(
                            title: { Text("Doğru Sayısı: \(gyTrueCount, specifier: "%.0f")") },
                            icon: { Image(systemName: "checkmark.circle") }
                        )
                    }
                        .sensoryFeedback(.selection, trigger: gyTrueCount)
                        .bold()
                    
                    Stepper(value: $gyFalseCount, in: 1...60) {
                        Label(
                            title: { Text("Yanlış Sayısı: \(gyFalseCount, specifier: "%.0f")") },
                            icon: { Image(systemName: "xmark.circle") }
                        )
                    }
                    
                        .sensoryFeedback(.selection, trigger: gyFalseCount)
                        .bold()
                    
                } header: {
                    Text("Genel Yetenek")
                        .foregroundStyle(.main)
                        .textCase(.none)
                }footer: {
                    if(gyTrueCount + gyFalseCount > 60) {
                        Text("Toplam doğru ve yanlış sayıları 60'ı geçemez")
                            .foregroundStyle(.red)
                    }
                }
                
                Section {
                    Text("2022 KPSS Puanı: \(result2022, specifier: "%.3f")")
                        .bold()
                    Text("2023 KPSS Puanı: \(result2023, specifier: "%.3f")")
                        .bold()
                    
                    CalculateButton(title: "Hesapla") {
                        // genel kültür ve genel yetenek netlerimizi hesaplıyoruz
                        
                        let gkNet = gkTrueCount - (gkFalseCount / 4)
                        let gyNet = gyTrueCount - (gyFalseCount / 4)
                        
                        
                        withAnimation{
                            result2023 = (51.209 + gyNet * 0.537 + gkNet * 0.418)
                            result2022 = (48.616 + gyNet * 0.4756 + gkNet * 0.4192)
                            
                        }
                            
                        
                        
                    }
                    .disabled(formControl)
                    .sensoryFeedback(.success, trigger: result2022)
                    
                    
                } header: {
                    Text("Sonuç")
                        .foregroundStyle(.main)
                        .textCase(.none)
                }
            }
        }
        .navigationTitle("Lisans (B Grubu)")
        .toolbar(.hidden, for: .tabBar)
    }
    
    
    var formControl: Bool {
        if((gyTrueCount + gyFalseCount) > 60 || (gkTrueCount + gkFalseCount) > 60) {
           return true
        }
        return false
    }
}

#Preview {
    LicenseView()
}
