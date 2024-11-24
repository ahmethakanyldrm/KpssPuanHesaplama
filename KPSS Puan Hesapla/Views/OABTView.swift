//
//  OABTView.swift
//  KPSS Puan Hesapla
//
//  Created by AHMET HAKAN YILDIRIM on 17.11.2024.
//

import SwiftUI
import SwiftData


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
    
    @Environment(\.modelContext) private var modelContext
    
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
                        
                        resultEB2022 = Constants.eb2022Score + gyNet * Constants.eb2022GYCoefficient + gkNet * Constants.eb2022GKCoefficient + ebNet * Constants.eb2022Coefficient
                        
                        resultEB2023 = Constants.eb2023Score + gyNet * Constants.eb2023GYCoefficient + gkNet * Constants.eb2023GKCoefficient + ebNet * Constants.eb2023Coefficient
                        
                        resultOABT2022 = oabtScore + gyNet * Constants.oabt2022GYCoefficient + gkNet * Constants.oabt2022GKCoefficient + ebNet * Constants.oabt2022EBCoefficient + oabtNet * oabtCoefficient
                        
                        result2022 = Constants.license2022Score + gyNet * Constants.license2022GYCoefficient + gkNet * Constants.license2022GKCoefficient
                        
                        result2023 = Constants.license2023Score + gyNet * Constants.license2023GYCoefficient + gkNet * Constants.license2023GKCoefficient
                        isShowingSheet.toggle()
                        
                        // SwiftData insert
                        let model2022oabt = Result(examName: "2022 ÖABT", gyNet: gyNet, gkNet: gkNet, oabtNet: oabtNet,result: resultOABT2022)
                        modelContext.insert(model2022oabt)
                        
                        
                        
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
