//
//  App Constants.swift
//  Disinfectapp
//
//  Created by David Bureš - P on 28.01.2025.
//

import Foundation
import OSLog

struct AppConstants
{
    static let shared: AppConstants = .init()
    
    let logger: Logger = .init(subsystem: "com.davidbures.disinfectapp", category: "general")
}
