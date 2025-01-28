import SwiftUI

@main
struct DisinfectappApp: App
{
    @State var appState: AppState = .init()
    @State var loadedAppTracker: LoadedAppTracker = .init()
    
    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
                .environment(appState)
                .environment(loadedAppTracker)
        }
        .windowToolbarStyle(.unified)
    }
}
