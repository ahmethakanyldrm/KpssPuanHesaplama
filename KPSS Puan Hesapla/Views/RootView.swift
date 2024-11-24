//
//  RootView.swift
//  KPSS Puan Hesapla
//
//  Created by AHMET HAKAN YILDIRIM on 17.11.2024.
//

import SwiftUI
import AppTrackingTransparency

struct RootView: View {
    @State private var selectionItem = 0
    
    var body: some View {
        TabView(selection: $selectionItem) {
            MainView()
                .tabItem {
                    Label("Ana Sayfa", systemImage: "house")
                        .environment(\.symbolVariants, selectionItem == 0 ? .fill : .none)
                }.tag(0)
            
            PastCalculationsView(selectionTabItem: $selectionItem)
                .tabItem {
                    Label("Sonuçlar", systemImage: "arrow.counterclockwise.circle")
                        .environment(\.symbolVariants, selectionItem == 1 ? .fill : .none)
                } .tag(1)
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
            ATTrackingManager.requestTrackingAuthorization(completionHandler: {status in
            })
        }
        
        .tint(.purple)
    }
    
        
        
}

#Preview {
    RootView()
}

