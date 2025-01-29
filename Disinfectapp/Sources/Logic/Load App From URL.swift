//
//  Load App From URL.swift
//  Disinfectapp
//
//  Created by David Bureš - P on 28.01.2025.
//

import Foundation
import SwiftUI

enum AppIconDiscoveryError: LocalizedError
{
    case plistDoesNotExist
    case couldNotdecodePlist
}

extension LoadedAppTracker
{
    // Load app information from that app's URL, and set the correct state for the UI
    func loadApp(fromURL url: URL, appState: AppState) async
    {
        appState.isLoading = true
        
        defer
        {
            appState.isLoading = false
        }
        
        let appBundleURL: URL = url.appendingPathComponent("Contents", conformingTo: .folder)

        let appResourcesURL: URL = appBundleURL.appendingPathComponent("Resources", conformingTo: .folder)

        let appName: String = url.deletingPathExtension().lastPathComponent

        let appIcon: Image? = {
            do throws(AppIconDiscoveryError)
            {
                let discoveredAppIconURL: URL = try discoverAppIconURL(fromBundleURL: appBundleURL, usingAppResourcesURL: appResourcesURL)
                
                return Image(nsImage: .init(contentsOf: discoveredAppIconURL)!)
            }
            catch let appIconDiscoveryError
            {
                switch appIconDiscoveryError
                {
                case .plistDoesNotExist:
                    print("Plist doesn't exist")
                    return nil
                case .couldNotdecodePlist:
                    print("Couldn't decode plist")
                    return nil
                }
            }            
        }()
        
        async let constructedAttributes: AppAttributes = await url.loadAttributes()
        
        let constructedDetails: AppDetails = .init(url: url, name: appName, icon: appIcon, isQuarantined: false)
        
        self.loadedAppDetails = constructedDetails
        self.appAttributes = await constructedAttributes
        
        appState.navigate(to: .overview)
    }

    /// Retrieve the complete URL to an Application's icon
    private func discoverAppIconURL(fromBundleURL bundleURL: URL, usingAppResourcesURL resourcesURL: URL) throws(AppIconDiscoveryError) -> URL
    {
        let plistURL: URL = bundleURL.appendingPathComponent("Info", conformingTo: .propertyList)

        guard let rawPlistData: Data = try? Data(contentsOf: plistURL)
        else
        {
            print("Plist for the app doesn't exist")
            
            throw .plistDoesNotExist
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

            throw .couldNotdecodePlist
        }
    }
}
