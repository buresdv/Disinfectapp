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
    func performDrop(info: DropInfo) -> Bool
    {
        guard info.hasItemsConforming(to: UTType.allowedTypesForImport)
        else
        {
            return false
        }
        
        let items = info.itemProviders(for: UTType.allowedTypesForImport)
        
        for item in items
        {
            _ = item.loadObject(ofClass: URL.self)
            { itemURL, error in
                if let itemURL
                {
                    print(itemURL)
                }
                print(error)
            }
        }
        
        return true
    }
}
