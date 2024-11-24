//
//  CalculateViewModel.swift
//  KPSS Puan Hesapla
//
//  Created by AHMET HAKAN YILDIRIM on 24.11.2024.
//

import Foundation
import Observation
import SwiftUI

@Observable
class CalculateViewModel {
    
  @ObservationIgnored @AppStorage("calculateCount") var calculateCount = 1
    
    
}
