//
//  Navigation Destinations.swift
//  Disinfectapp
//
//  Created by David Bureš - P on 28.01.2025.
//

import Foundation

enum NavigationDestination: CustomStringConvertible
{
    case overview

    case root

    var description: String
    {
        switch self
        {
        case .overview:
            return String(localized: "navigation.overview.title")
        case .root:
            return String(localized: "navigation.root.title")
        }
    }
}
