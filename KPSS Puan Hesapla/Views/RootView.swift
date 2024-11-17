//
//  RootView.swift
//  KPSS Puan Hesapla
//
//  Created by AHMET HAKAN YILDIRIM on 17.11.2024.
//

import SwiftUI

struct RootView: View {
    @State private var selectionItem = 0
    
    var body: some View {
        TabView(selection: $selectionItem) {
            MainView()
                .tabItem {
                    Label("Ana Sayfa", systemImage: "house")
                }.tag(0)
            
            ResultView()
                .tabItem {
                    Label("Sonuçlar", systemImage: "arrow.counterclockwise.circle")
                       
                } .tag(1)
        }
    }
}

#Preview {
    RootView()
}

