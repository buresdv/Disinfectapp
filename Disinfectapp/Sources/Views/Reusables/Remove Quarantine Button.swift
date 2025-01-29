//
//  Remove Quarantine Button.swift
//  Disinfectapp
//
//  Created by David Bureš - P on 28.01.2025.
//

import SwiftUI

struct RemoveQuarantineButton: View
{
    @Environment(AppState.self) var appState
    @Environment(LoadedAppTracker.self) var loadedAppTracker
    
    var body: some View
    {
        Button
        {
            print("Would remove quarantine")
        } label: {
            Text("action.remove-quarantine")
        }
        .keyboardShortcut(.defaultAction)
    }
}
