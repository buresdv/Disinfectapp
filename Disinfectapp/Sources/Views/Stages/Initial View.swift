//
//  Initial View.swift
//  Disinfectapp
//
//  Created by David Bureš - P on 28.01.2025.
//

import SwiftUI
import UniformTypeIdentifiers

struct InitialView: View
{
    @Environment(AppState.self) var appState
    @Environment(LoadedAppTracker.self) var loadedAppTracker

    var body: some View
    {
        @Bindable var appState: AppState = appState

        VStack
        {
            if appState.isLoading
            {
                WorkingView()
            }
            else
            {
                Text("ready.title")
            }
            
        }
        .toolbar
        {
            ToolbarItem(placement: .primaryAction)
            {
                Button
                {
                    appState.isShowingAppPicker = true
                } label: {
                    Label("action.load", systemImage: "scope")
                }
            }
        }
        .fileImporter(isPresented: $appState.isShowingAppPicker, allowedContentTypes: UTType.allowedTypesForImport, allowsMultipleSelection: false)
        { result in
            switch result
            {
            case .success(let success):
                Task
                {
                    await loadedAppTracker.loadApp(fromURL: success.first!, appState: appState)
                    
                    appState.navigate(to: .overview)
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
