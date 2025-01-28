//
//  Overview View.swift
//  Disinfectapp
//
//  Created by David Bureš - P on 28.01.2025.
//

import SwiftUI

struct OverviewView: View
{
    
    let appDetails: LoadedAppTracker.AppDetails?
    
    var body: some View
    {
        if let appDetails
        {
            VStack
            {
                if let appIcon = appDetails.icon
                {
                    appIcon
                }
                else
                {
                    Image(systemName: "questionmark.app")
                }
                
                Text(appDetails.name)
            }
        }
        else
        {
            Text("status.load-failed")
        }
    }
}
