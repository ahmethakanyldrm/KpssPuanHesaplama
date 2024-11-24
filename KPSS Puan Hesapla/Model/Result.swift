//
//  Result.swift
//  KPSS Puan Hesapla
//
//  Created by AHMET HAKAN YILDIRIM on 24.11.2024.
//

import Foundation
import SwiftData

@Model
final class Result: Identifiable {
    
    @Attribute(.unique) let id = UUID()
    let examName: String
    let gyNet: Double
    let gkNet: Double
    let ebNet: Double?
    let oabtNet: Double?
    let date = Date()
    let result: Double
    
    init(examName: String, gyNet: Double, gkNet: Double, ebNet: Double? = nil, oabtNet: Double? = nil, result: Double) {
        self.examName = examName
        self.gyNet = gyNet
        self.gkNet = gkNet
        self.ebNet = ebNet
        self.oabtNet = oabtNet
        self.result = result
    }
    
}
