//
//  EducationalSciencesView.swift
//  KPSS Puan Hesapla
//
//  Created by AHMET HAKAN YILDIRIM on 17.11.2024.
//

import SwiftUI

// Eğitim Bilimleri
struct EducationalSciencesView: View {
    @State private var gkTrueCount: Double = 30
    @State private var gkFalseCount: Double = 0
    
    @State private var gyTrueCount: Double = 30
    @State private var gyFalseCount: Double = 0
    
    @State private var ebTrueCount: Double = 40
    @State private var ebFalseCount: Double = 0
    
    @State private var result2022: Double = 0
    @State private var result2023: Double = 0
    @State private var resultEB2022: Double = 0
    @State private var resultEB2023: Double = 0
    
    @State private var isShowingSheet = false

    
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
                    Stepper(value: $ebTrueCount, in: 1...80) {
                        Label(
                            title: { Text("Doğru Sayısı: \(ebTrueCount, specifier: "%.0f")") },
                            icon: { Image(systemName: "checkmark.circle") }
                        )
                    }
                    
                        .sensoryFeedback(.selection, trigger: ebTrueCount)
                        .bold()
                    
                    Stepper(value: $ebFalseCount, in: 1...80) {
                        Label(
                            title: { Text("Yanlış Sayısı: \(ebFalseCount, specifier: "%.0f")") },
                            icon: { Image(systemName: "xmark.circle") }
                        )
                    }
                    
                   
                        .sensoryFeedback(.selection, trigger: ebFalseCount)
                        .bold()
                    
                    
                    CalculateButton(title: "Hesapla") {
                
                        let gkNet = gkTrueCount - (gkFalseCount / 4)
                        let gyNet = gyTrueCount - (gyFalseCount / 4)
                        let ebNet = ebTrueCount - (ebFalseCount / 4)
      
                            
                            resultEB2022 = 36.812 + gyNet * 0.3985 + gkNet * 0.3512 + ebNet * 0.34714
                            resultEB2023 = 40.405 + gyNet * 0.3493 + gkNet * 0.3672 + ebNet * 0.37145
                            
                            result2022 = 48.616 + gyNet * 0.4756 + gkNet * 0.4192
                            result2023 = 51.209 + gyNet * 0.537 + gkNet * 0.418
                        
                        isShowingSheet.toggle()
                        
                    }
                    .disabled(formControl)
                    .sensoryFeedback(.success, trigger: result2023)
                    .sheet(isPresented: $isShowingSheet) {
                        ResultView(result2022: result2022, resultEB2022: resultEB2022, resultOABT2022: nil, result2023: result2023, resultEB2023: resultEB2023, resultOABT2023: nil)
                    }
                    
                    
                } header: {
                    Text("Eğitim Bilimleri")
                        .foregroundStyle(.main)
                        .textCase(.none)
                }footer: {
                    if(ebTrueCount + ebFalseCount > 68) {
                        Text("Toplam doğru ve yanlış sayıları 80'i geçemez")
                            .foregroundStyle(.red)
                    }
                }
                
            }
        }
        .navigationTitle("Eğitim Bilimleri")
        .toolbar(.hidden, for: .tabBar)
    }
    
    
    var formControl: Bool {
        if((gyTrueCount + gyFalseCount) > 60 || (gkTrueCount + gkFalseCount) > 60 || (ebTrueCount + ebFalseCount > 80)) {
           return true
        }
        return false
    }
}

#Preview {
    EducationalSciencesView()
}
