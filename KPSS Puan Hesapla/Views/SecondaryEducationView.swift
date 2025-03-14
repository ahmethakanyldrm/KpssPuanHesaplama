//
//  SecondaryEducationView.swift
//  KPSS Puan Hesapla
//
//  Created by AHMET HAKAN YILDIRIM on 17.11.2024.
//

import SwiftUI
import SwiftData


// Ortaöğretim
struct SecondaryEducationView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    
    @State private var gkTrueCount: Double = 60
    @State private var gkFalseCount: Double = 0
    
    @State private var gyTrueCount: Double = 30
    @State private var gyFalseCount: Double = 0
    
    @State private var result: Double = 0
    
    let adCoordinator = AdCoordinator()
    
    @State private var viewModel = CalculateViewModel()
    
    
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
                    Text("KPSS Puanı: \(result, specifier: "%.3f")")
                        .bold()
                    
                    CalculateButton(title: "Hesapla") {
                        // genel kültür ve genel yetenek netlerimizi hesaplıyoruz
                        
                        let gkNet = gkTrueCount - (gkFalseCount / 4)
                        let gyNet = gyTrueCount - (gyFalseCount / 4)
                        
                        
                        withAnimation{
                            result = Constants.secondaryEducationScore + gyNet * Constants.secondaryEducationGYCoefficient + gkNet * Constants.secondaryEducationGKCoefficient
                        }
                        // SwiftData insert
                        let model = Result(examName: "Ortaöğretim KPSS", gyNet: gyNet, gkNet: gkNet, result: result)
                        modelContext.insert(model)
                            
                        // Admob
                        
                        if viewModel.calculateCount % 3 == 0 {
                            adCoordinator.presentAd()
                        }
                        viewModel.calculateCount += 1
                        
                    }
                    .disabled(formControl)
                    .sensoryFeedback(.success, trigger: result)
                    
                    
                } header: {
                    Text("Sonuç")
                        .foregroundStyle(.main)
                        .textCase(.none)
                }
            }
        }
        .navigationTitle("Ortaöğretim")
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
    SecondaryEducationView()
}
