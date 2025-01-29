//
//  Overview View.swift
//  Disinfectapp
//
//  Created by David Bureš - P on 28.01.2025.
//

import SwiftUI

struct OverviewView: View
{
    @Environment(AppState.self) var appState
    
    let appDetails: LoadedAppTracker.AppDetails?
    let appAttributes: LoadedAppTracker.AppAttributes?

    var body: some View
    {
        switch appState.overviewStage
        {
        case .ready:
            ReadyStageView()
        case .showingDetails:
            
        case .working:
        case .finished:
            
        }
        if let appDetails
        {
            VStack(alignment: .center, spacing: 20)
            {
                VStack(alignment: .center, spacing: 10)
                {
                    Group
                    {
                        if let appIcon = appDetails.icon
                        {
                            appIcon
                                .resizable()
                        }
                        else
                        {
                            Image(systemName: "questionmark.app")
                                .resizable()
                        }
                    }
                    .frame(width: 100, height: 100, alignment: .center)
                    
                    Text(appDetails.name)
                        .font(.headline)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .center, spacing: 15)
                {
                        if let appAttributes
                        {
                            switch appAttributes.isQuarantined
                            {
                            case true:
                                Label("status.quarantined", systemImage: "hand.raised")
                                    .font(.largeTitle)
                                RemoveQuarantineButton()
                                
                            case false:
                                Label("status.not-quarantined", systemImage: "hand.raised.slash")
                                    .font(.largeTitle)
                                Text("text.no-action-needed")
                            }
                        }
                }
            }
        }
        else
        {
            Text("status.load-failed")
        }
    }
}
