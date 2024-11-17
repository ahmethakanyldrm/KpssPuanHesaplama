//
//  KPSS_Puan_HesaplaApp.swift
//  KPSS Puan Hesapla
//
//  Created by AHMET HAKAN YILDIRIM on 17.11.2024.
//

import SwiftUI

@main
struct KPSS_Puan_HesaplaApp: App {
    
    init() {
        // scroll ve default durumda navbarın nasıl davranacağını belirleme
        let appearanceNav = UINavigationBarAppearance()
        appearanceNav.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = appearanceNav
        UINavigationBar.appearance().scrollEdgeAppearance = appearanceNav
        
        // scroll ve default durumda tabbarın nasıl davranacağını belirleme

        let appearanceTab = UITabBarAppearance()
        appearanceTab.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = appearanceTab
        UITabBar.appearance().standardAppearance = appearanceTab
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
