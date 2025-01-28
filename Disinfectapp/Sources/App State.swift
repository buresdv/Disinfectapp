//
//  App State.swift
//  Disinfectapp
//
//  Created by David Bureš - P on 28.01.2025.
//

import Foundation
import SwiftUI

@Observable
class AppState
{
    var isLoading: Bool = false
    
    var navigationPath: NavigationPath = .init()

    func navigate(to destination: NavigationDestination)
    {
        if destination == .root
        {
            self.navigationPath = .init()
        }
        else
        {
            self.navigationPath.append(destination)
        }
    }
    
    var isShowingAppPicker: Bool = false
}
