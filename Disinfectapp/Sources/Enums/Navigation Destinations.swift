//
//  Navigation Destinations.swift
//  Disinfectapp
//
//  Created by David Bureš - P on 28.01.2025.
//

import Foundation

enum NavigationDestination: CustomStringConvertible
{
    case overview, working, finished

    case root

    var description: String
    {
        switch self
        {
        case .overview:
            return String(localized: "navigation.overview.title")
        case .working:
            return String(localized: "navigation.working.title")
        case .finished:
            return String(localized: "navigation.finished.title")
        case .root:
            return String(localized: "navigation.root.title")
        }
    }
}
