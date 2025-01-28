//
//  Load App From URL.swift
//  Disinfectapp
//
//  Created by David Bureš - P on 28.01.2025.
//

import Foundation
import SwiftUI

extension LoadedAppTracker
{
    func loadApp(fromURL url: URL) async -> AppDetails
    {
        let appBundleURL: URL = url.appendingPathComponent("Contents", conformingTo: .folder)
        
        let appResourcesURL: URL = appBundleURL.appendingPathComponent("Resources", conformingTo: .folder)
        
        let appName: String = url.lastPathComponent
        
        let appIcon: Image? = {
            
            guard let discoveredAppIconURL: URL = discoverAppIconURL(fromBundleURL: appBundleURL, usingAppResourcesURL: appResourcesURL) else
            {
                print("Icon file does not exist for app \(url)")
                return nil
            }
            
            return Image(nsImage: .init(contentsOf: discoveredAppIconURL)!)
        }()
        
        return .init(url: url, name: appName, icon: appIcon)
    }
    
    private func discoverAppIconURL(fromBundleURL bundleURL: URL, usingAppResourcesURL resourcesURL: URL) -> URL?
    {
        let plistURL: URL = bundleURL.appendingPathComponent("Info", conformingTo: .propertyList)
        
        guard let rawPlistData: Data = try? Data(contentsOf: plistURL) else
        {
            print("Plist for the app doesn't exist")
            return nil
        }
        
        struct RawPlistRepresentation: Codable
        {
            var CFBundleIconFile: String
        }
        
        let plistDecoder: PropertyListDecoder = .init()
        
        do
        {
            let decodedIconName: String = try plistDecoder.decode(RawPlistRepresentation.self, from: rawPlistData).CFBundleIconFile
            
            print("Decoded icon name: \(decodedIconName)")
            
            let fullAppIconURL: URL = resourcesURL.appendingPathComponent(decodedIconName, conformingTo: .icns)
            
            print("Full icon path: \(fullAppIconURL)")
            
            return fullAppIconURL
        }
        catch
        {
            print("Failed to decode Info.plist: \(error.localizedDescription)")
            
            return nil
        }
    }
}
