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
    
    var body: some View {
        VStack {
            
            Form {
                Section {
                    Stepper("Doğru Sayısı: \(gkTrueCount, specifier: "%.0f")", value: $gkTrueCount, in: 1...60)
                        .sensoryFeedback(.selection, trigger: gkTrueCount)
                        .bold()
                    Stepper("Yanlış Sayısı: \(gkFalseCount, specifier: "%.0f")", value: $gkFalseCount, in: 0...60)
                        .sensoryFeedback(.selection, trigger: gkFalseCount)
                        .bold()
                    
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
                        .bold()
                    Stepper("Yanlış Sayısı: \(gyFalseCount, specifier: "%.0f")", value: $gyFalseCount, in: 0...60)
                        .sensoryFeedback(.selection, trigger: gyFalseCount)
                        .bold()
                    
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
                    Stepper("Doğru Sayısı: \(ebTrueCount, specifier: "%.0f")", value: $ebTrueCount, in: 1...80)
                        .sensoryFeedback(.selection, trigger: ebTrueCount)
                        .bold()
                    Stepper("Yanlış Sayısı: \(ebFalseCount, specifier: "%.0f")", value: $ebFalseCount, in: 0...80)
                        .sensoryFeedback(.selection, trigger: ebFalseCount)
                        .bold()
                    
                } header: {
                    Text("Eğitim Bilimleri")
                        .textCase(.none)
                }footer: {
                    if(ebTrueCount + ebFalseCount > 68) {
                        Text("Toplam doğru ve yanlış sayıları 80'i geçemez")
                            .foregroundStyle(.red)
                    }
                }
                
                Section {
                    VStack (alignment: .leading){
                        Text("2023 P3(Memur) Puanı: \(result2023, specifier: "%.3f")")
                            .bold()
                        
                        Text("2023 P10(Öğretmen) Puanı: \(resultEB2023, specifier: "%.3f")")
                            .bold()
                    }
                    
                    VStack (alignment: .leading) {
                        Text("2022 P3(Memur) Puanı: \(result2022, specifier: "%.3f")")
                            .bold()
                        
                        Text("2022 P10(Öğretmen) Puanı: \(resultEB2022, specifier: "%.3f")")
                            .bold()
                    }
                    
                   
                    
                    CalculateButton(title: "Hesapla") {
                       
                        
                        let gkNet = gkTrueCount - (gkFalseCount / 4)
                        let gyNet = gyTrueCount - (gyFalseCount / 4)
                        let ebNet = ebTrueCount - (ebFalseCount / 4)
                        
                        withAnimation{
                            
                            // genel kültür, genel yetenek, eğitim bilimleri netlerimizi hesaplıyoruz
                            
                            resultEB2022 = 36.812 + gyNet * 0.3985 + gkNet * 0.3512 + ebNet * 0.34714
                            resultEB2023 = 40.405 + gyNet * 0.3493 + gkNet * 0.3672 + ebNet * 0.37145
                            
                            result2022 = 48.616 + gyNet * 0.4756 + gkNet * 0.4192
                            result2023 = 51.209 + gyNet * 0.537 + gkNet * 0.418
                            
                        }
                            
                        
                        
                    }
                    .disabled(formControl)
                    .sensoryFeedback(.success, trigger: result2023)
                    
                    
                } header: {
                    Text("Sonuç")
                        .textCase(.none)
                }
            }
        }
        .navigationTitle("Eğitim Bilimleri")
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
