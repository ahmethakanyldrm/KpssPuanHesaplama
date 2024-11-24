//
//  ResultView.swift
//  KPSS Puan Hesapla
//
//  Created by AHMET HAKAN YILDIRIM on 24.11.2024.
//

import SwiftUI

struct ResultView: View {
    
    let result2022: Double
    let resultEB2022: Double
    let resultOABT2022: Double?
    
    let result2023: Double
    let resultEB2023: Double
    let resultOABT2023: Double?
    
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        
        NavigationStack {
            VStack {
                List {
                    Section {
                        Text("2023 P3(Memur) Puanı: \(result2023, specifier: "%.3f")")
                            .bold()
                        
                        Text("2023 P10(Öğretmen) Puanı: \(resultEB2023, specifier: "%.3f")")
                            .bold()
                        if resultOABT2023 != nil {
                            Text("2023 P121(Alan) Puanı: \(resultOABT2023 ?? 0, specifier: "%.3f")")
                                .bold()
                        }
                        
                    } header: {
                        Text("2023 KPSS")
                            .bold()
                            .foregroundStyle(.main)
                    }
                    
                    Section {
                        Text("2022 P3(Memur) Puanı: \(result2022, specifier: "%.3f")")
                            .bold()
                        
                        Text("2022 P10(Öğretmen) Puanı: \(resultEB2022, specifier: "%.3f")")
                            .bold()
                        
                        if resultOABT2022 != nil {
                            Text("2022 P121(Alan) Puanı: \(resultOABT2022 ?? 0, specifier: "%.3f")")
                                .bold()
                        }
                       
                    } header: {
                        Text("2022 KPSS")
                            .bold()
                            .foregroundStyle(.main)
                    }
                }
            }
            .navigationTitle("Sonuç")
            .toolbar {
                ToolbarItem {
                    Button("Kapat", systemImage: "xmark") {
                        dismiss()
                    }
                }
            }
           

        }
    }
}

#Preview {
    ResultView(result2022: 0, resultEB2022: 0, resultOABT2022: 0, result2023: 0, resultEB2023: 0, resultOABT2023: 0)
}
