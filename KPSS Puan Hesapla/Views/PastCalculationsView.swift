//
//  ResultView.swift
//  KPSS Puan Hesapla
//
//  Created by AHMET HAKAN YILDIRIM on 17.11.2024.
//

import SwiftUI
import SwiftData
import Lottie

struct PastCalculationsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Result.date, order: .reverse) private var results: [Result]
    @Binding var selectionTabItem: Int
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(results) {result in
                        VStack(alignment: .leading) {
                            Text(result.examName)
                                .font(.title2)
                                .bold()
                                .font(.headline)
                            
                            HStack {
                                HStack(alignment: .top) {
                                    Text("Genel Yetenek:")
                                        .foregroundStyle(.red)
                                        
                                    Text(result.gyNet.formatted())
                                        .bold()
                                    
                                }
                                Spacer()
                                HStack(alignment: .top) {
                                    Text("ÖABT:")
                                        .foregroundStyle(.red)
                                        
                                    Text((result.oabtNet ?? 0).formatted())
                                        .bold()
                                    
                                }
                            }
                            
                            HStack {
                                HStack(alignment: .top) {
                                    Text("Genel Kültür:")
                                        .foregroundStyle(.red)
                                    
                                    Text(result.gkNet.formatted())
                                        .bold()
                                    
                                }
                                Spacer()
                                HStack(alignment: .top) {
                                    Text("Eğitim Bilimleri:")
                                        .foregroundStyle(.red)
                                    
                                    Text((result.ebNet ?? 0).formatted())
                                        .bold()
                                    
                                }
                            }
                            Divider()
                            HStack {
                                Text("Puan:")
                                    .foregroundStyle(.red)
                                Text(result.result.formatted())
                                    .bold()
                                    .italic()
                            }
                            
                            HStack {
                                Spacer()
                                Text(result.date.formatted(date: .numeric, time: .standard))
                                    .italic()
                                    .font(.footnote)
                            }
                            
                        }
                    }
                    .onDelete {indexSet in
                        for index in indexSet {
                            modelContext.delete(results[index])
                        }
                    }
                }
                .overlay {
                    GeometryReader { geo in
                        if results.isEmpty {
                           
                            ContentUnavailableView {
                                Text("Sonuç Bulunamadı")
                                    .foregroundStyle(.main)
                                
                            } description: {
                                VStack {
                                    Text("Henüz sonuç bulanamadı. Puan hesaplamaya başlamak için lütfen Ana sayfaya gidin ...")
                                    LottieView(animation: .named("notfound"))
                                        .looping()
                                        .frame(height: geo.size.height * 0.5)
                                        .shadow(radius: 10)
                                }
                            } actions: {
                                Button("KPSS Puan Hesaplaması Yap") {
                                    selectionTabItem = 0
                                }
                            }
                        }
                    }
                }
                
            }
            .navigationTitle("Geçmiş Hesaplamalar")
            
            
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    PastCalculationsView(selectionTabItem: .constant(1))
}
