//
//  OABTView.swift
//  KPSS Puan Hesapla
//
//  Created by AHMET HAKAN YILDIRIM on 17.11.2024.
//

import SwiftUI

struct OABTView: View {
    @State private var gkTrueCount: Double = 30
    @State private var gkFalseCount: Double = 0
    
    @State private var gyTrueCount: Double = 30
    @State private var gyFalseCount: Double = 0
    
    @State private var ebTrueCount: Double = 40
    @State private var ebFalseCount: Double = 0
    
    @State private var oabtTrueCount: Double = 40
    @State private var oabtFalseCount: Double = 0
    
    @State private var result2022: Double = 0
    @State private var result2023: Double = 0
    @State private var resultEB2022: Double = 0
    @State private var resultEB2023: Double = 0
    @State private var resultOABT2022: Double = 0
    
    @State private var oabtCoefficient = 0.434
    @State private var oabtScore = 43.805
    
    
    @State private var isShowingSheet = false
    @State private var selectedOption = 0
    
    let options = [
        (0.4334,43.805, "Beden Eğitimi"),
        (0.3666,41.071, "Biyoloji"),
        (0.4301,39.060, "Coğrafya"),
        (0.4052,34.908, "Din Kültürü"),
        (0.3679,42.156, "Edebiyat"),
        (0.5388,39.313, "Fen Bilgisi"),
        (0.3817,41.604, "Fizik"),
        (0.5225,36.309, "İlköğretim Matematik"),
        (0.3883,37.962, "İmam Hatip Meslek Dersleri Ö."),
        (0.3791,40.920, "İngilizce"),
        (0.4542,42.157, "Kimya"),
        (0.4247,41.759, "Lise Matematik"),
        (0.4944,33.292, "Okul Öncesi"),
        (0.4883,29.014, "Rehberlik "),
        (0.6184,33.598, "Sınıf Öğretmenliği"),
        (0.6142,34.101, "Sosyal Bilgiler"),
        (0.3521,41.418, "Tarih"),
        (0.4565,34.329, "Türkçe")
    ]
    
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
                    
                } header: {
                    Text("Eğitim Bilimleri")
                        .foregroundStyle(.main)
                        .textCase(.none)
                }footer: {
                    if(ebTrueCount + ebFalseCount > 80) {
                        Text("Toplam doğru ve yanlış sayıları 80'i geçemez")
                            .foregroundStyle(.red)
                    }
                }
                
                Section {
                    Picker("Bölüm Seçiniz", selection: $selectedOption) {
                        ForEach(0..<options.count, id: \.self) { index in
                            HStack {
                                Image(systemName: "person.circle.fill")
                                
                                Text(options[index].2)
                            }
                        }
                    }
                    .onChange(of: selectedOption) {
                        oabtCoefficient = options[selectedOption].0
                        oabtScore = options[selectedOption].1
                    }
                    
                    
                    
                    Stepper(value: $oabtTrueCount, in: 1...75) {
                        Label(
                            title: { Text("Doğru Sayısı: \(oabtTrueCount, specifier: "%.0f")") },
                            icon: { Image(systemName: "checkmark.circle") }
                        )
                    }
                        .sensoryFeedback(.selection, trigger: oabtTrueCount)
                        .bold()
                    
                    Stepper(value: $oabtFalseCount, in: 1...75) {
                        Label(
                            title: { Text("Yanlış Sayısı: \(oabtFalseCount, specifier: "%.0f")") },
                            icon: { Image(systemName: "xmark.circle") }
                        )
                    }
                        .sensoryFeedback(.selection, trigger: oabtFalseCount)
                        .bold()
                    
                    CalculateButton(title: "Hesapla") {
                        
                        let gkNet = gkTrueCount - (gkFalseCount / 4)
                        let gyNet = gyTrueCount - (gyFalseCount / 4)
                        let ebNet = ebTrueCount - (ebFalseCount / 4)
                        
                        let oabtNet = oabtTrueCount - (oabtFalseCount / 4)
                        
                        resultEB2022 = 36.812 + gyNet * 0.3985 + gkNet * 0.3512 + ebNet * 0.34714
                        resultEB2023 = 40.405 + gyNet * 0.3493 + gkNet * 0.3672 + ebNet * 0.37145
                        
                        resultOABT2022 = oabtScore + gyNet * 0.1720 + gkNet * 0.1515 + ebNet * 0.1498 + oabtNet * oabtCoefficient
                        
                        result2022 = 48.616 + gyNet * 0.4756 + gkNet * 0.4192
                        result2023 = 51.209 + gyNet * 0.537 + gkNet * 0.418
                        isShowingSheet.toggle()
                        
                        
                    }
                    .disabled(formControl)
                    .sensoryFeedback(.success, trigger: result2023)
                    .sheet(isPresented: $isShowingSheet) {
                        ResultView(result2022: result2022, resultEB2022: resultEB2022, resultOABT2022: resultOABT2022, result2023: result2023, resultEB2023: resultEB2023, resultOABT2023: nil)
                    }
                    
                } header: {
                    Text("ÖABT")
                        .foregroundStyle(.main)
                        .textCase(.none)
                }footer: {
                    if(oabtTrueCount + oabtFalseCount > 78) {
                        Text("Toplam doğru ve yanlış sayıları 75'i geçemez")
                            .foregroundStyle(.red)
                    }
                }
                
               
            }
        }
        .navigationTitle("ÖABT")
        .toolbar(.hidden, for: .tabBar)
    }
    
    
    var formControl: Bool {
        if((gyTrueCount + gyFalseCount) > 60 || (gkTrueCount + gkFalseCount) > 60 || (ebTrueCount + ebFalseCount > 80) || (oabtTrueCount + oabtFalseCount > 75)) {
            return true
        }
        return false
    }
}

#Preview {
    OABTView()
}
