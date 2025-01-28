//
//  Loaded App Tracker.swift
//  Disinfectapp
//
//  Created by David Bureš - P on 28.01.2025.
//

import Foundation
import SwiftUI

@Observable
class LoadedAppTracker
{
    var loadedAppDetails: LoadedAppTracker.AppDetails?
    
    func clearLoadedApp()
    {
        self.loadedAppDetails = nil
    }
    
    struct AppDetails
    {
        var url: URL
        var name: String
        
        var icon: Image?
    }
}
