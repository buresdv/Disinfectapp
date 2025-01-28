import SwiftUI

public struct ContentView: View
{
    @Environment(AppState.self) var appState
    @Environment(LoadedAppTracker.self) var loadedAppTracker

    public var body: some View
    {
        @Bindable var appState: AppState = appState

        NavigationStack(path: $appState.navigationPath)
        {
            InitialView()
                .navigationDestination(for: NavigationDestination.self)
                { destination in
                    Group
                    {
                        switch destination
                        {
                        case .overview:
                            OverviewView(appDetails: loadedAppTracker.loadedAppDetails)
                        case .finished:
                            Text("Hello")
                        case .root:
                            InitialView()
                        }
                    }
                    .navigationTitle(destination.description)
                }
                .onDrop(of: [.application], delegate: AppDropDelegate(loadedAppTracker: loadedAppTracker, appState: appState))
        }
    }
}
