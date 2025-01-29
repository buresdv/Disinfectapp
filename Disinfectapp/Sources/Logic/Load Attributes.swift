//
//  Load Attributes.swift
//  Disinfectapp
//
//  Created by David Bureš - P on 28.01.2025.
//

import Foundation
import XAttr

extension URL
{
    func loadAttributes() async -> LoadedAppTracker.AppAttributes
    {
        let terminalOutputRaw: String = await shell(URL(string: "/usr/bin/xattr")!, [self.path]).standardOutput
        
        var constructedAttributes: LoadedAppTracker.AppAttributes = .init(isQuarantined: false)
        
        print(terminalOutputRaw)
        
        if terminalOutputRaw.contains("com.apple.quarantine")
        {
            constructedAttributes.isQuarantined = true
        }
        else
        {
            constructedAttributes.isQuarantined = false
        }
        
        return constructedAttributes
    }
}
