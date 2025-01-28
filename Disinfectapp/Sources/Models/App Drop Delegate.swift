//
//  App Drop Delegate.swift
//  Disinfectapp
//
//  Created by David Bureš - P on 28.01.2025.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct AppDropDelegate: DropDelegate
{
    let loadedAppTracker: LoadedAppTracker
    @Bindable var appState: AppState
    
    func performDrop(info: DropInfo) -> Bool
    {
        guard info.hasItemsConforming(to: UTType.allowedTypesForImport)
        else
        {
            print("No conforming items found")
            return false
        }
        
        let items = info.itemProviders(for: UTType.allowedTypesForImport)
        
        for item in items
        {
            print("Item: \(item)")
            _ = item.loadObject(ofClass: URL.self)
            { itemURL, error in
                if let itemURL
                {
                    print(itemURL)
                    Task
                    {
                        await loadedAppTracker.loadApp(fromURL: itemURL, appState: appState)
                    }
                }
            }
        }
        
        return true
    }
}
