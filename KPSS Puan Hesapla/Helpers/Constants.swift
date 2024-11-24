//
//  Constants.swift
//  KPSS Puan Hesapla
//
//  Created by AHMET HAKAN YILDIRIM on 24.11.2024.
//

import Foundation

final class Constants {
    
    private init() {}
    
    // Ortaöğretim
    
    static let secondaryEducationScore = 55.839
    static let secondaryEducationGYCoefficient = 0.348
    static let secondaryEducationGKCoefficient = 0.431
    
    // Önlisans
    static let associateScore = 53.816
    static let associateGYCoefficient = 0.43
    static let associateGKCoefficient = 0.397
    
    // Lisans
    static let license2023Score = 51.209
    static let license2023GYCoefficient = 0.537
    static let license2023GKCoefficient = 0.418
    static let license2022Score = 48.616
    static let license2022GYCoefficient = 0.4756
    static let license2022GKCoefficient = 0.4192
    
    // Eğitim Bilimleri
    static let eb2023Score = 40.405
    static let eb2023GYCoefficient = 0.3493
    static let eb2023GKCoefficient = 0.3672
    static let eb2023Coefficient = 0.37145
    
    static let eb2022Score = 36.812
    static let eb2022GYCoefficient = 0.3985
    static let eb2022GKCoefficient = 0.3512
    static let eb2022Coefficient = 0.34714
    
    // ÖABT
    static let oabt2022GYCoefficient = 0.1720
    static let oabt2022GKCoefficient = 0.1515
    static let oabt2022EBCoefficient = 0.1498
    
    // Admob
    static let bannerUnitID = "ca-app-pub-5367651791530121/2679880135"
    static let interstitialUnitID  = "ca-app-pub-5367651791530121/1850185638"
    
    static let bannerUnitIDTest    = "ca-app-pub-3940256099942544/2435281174"
    static let interstitialUnitIDTest = "ca-app-pub-3940256099942544/4411468910"
}
