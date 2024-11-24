//
//  MainView.swift
//  KPSS Puan Hesapla
//
//  Created by AHMET HAKAN YILDIRIM on 17.11.2024.
//

import SwiftUI
import GoogleMobileAds

struct MainView: View {
    
    var width: CGFloat = UIScreen.main.bounds.width
    var size: CGSize {
        return GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(width).size
    }
    
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        NavigationLink(destination: SecondaryEducationView()) {
                            HStack {
                                Image(systemName: "1.circle")
                                    .resizable()
                                    .foregroundStyle(.blue)
                                    .frame(width: 30, height: 30)
                                
                                Text("Ortaöğretim")
                                    .badge(
                                     Text("P94")
                                        .italic()
                                        .foregroundStyle(.main)
                                    )
                                
                            }
                        }
                        NavigationLink(destination: AssociateView()) {
                            HStack {
                                Image(systemName: "2.circle")
                                    .resizable()
                                    .foregroundStyle(.blue)
                                    .frame(width: 30, height: 30)
                                
                                Text("Önlisans")
                                    .badge(
                                     Text("P93")
                                        .italic()
                                        .foregroundStyle(.main)
                                    )
                                
                            }
                        }
                        NavigationLink(destination: LicenseView()) {
                            HStack {
                                Image(systemName: "3.circle")
                                    .resizable()
                                    .foregroundStyle(.blue)
                                    .frame(width: 30, height: 30)
                                
                                Text("Lisans (B Grubu)")
                                    .badge(
                                     Text("P3")
                                        .italic()
                                        .foregroundStyle(.main)
                                    )
                                
                            }
                        }
                        NavigationLink(destination: EducationalSciencesView()) {
                            HStack {
                                Image(systemName: "4.circle")
                                    .resizable()
                                    .foregroundStyle(.blue)
                                    .frame(width: 30, height: 30)
                                
                                Text("Eğitim Bilimleri")
                                    .badge(
                                     Text("P10")
                                        .italic()
                                        .foregroundStyle(.main)
                                    )
                                
                            }
                        }
                        NavigationLink(destination: OABTView())  {
                            HStack {
                                Image(systemName: "5.circle")
                                    .resizable()
                                    .foregroundStyle(.blue)
                                    .frame(width: 30, height: 30)
                                
                                Text("ÖABT")
                                    .badge(
                                     Text("P121")
                                        .italic()
                                        .foregroundStyle(.main)
                                    )
                                
                            }
                        }
                    } header: {
                        Text("Bölüm Seçiniz")
                            .textCase(.none)
                    }
                    
                }
                
                BannerView()
                    .frame(height: size.height)
                
            }
            .navigationTitle("KPSS Puan Hesaplama")
        }
    }
}

#Preview {
    MainView()
}
