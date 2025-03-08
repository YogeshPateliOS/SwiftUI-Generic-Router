import SwiftUI

/// ContentView contains a TabView to switch between Music and Movie flows
struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Musics", systemImage: "music.note.house.fill") {
                MusicView()
            }
            
            Tab("Movies", systemImage: "movieclapper.fill") {
                MovieView()
            }
        }
    }
}

/// MusicView manages the Music flow and uses Router to handle navigation
struct MusicView: View {
    
    /// Router managing navigation between the screens
    @StateObject private var router = MusicFlowRouter()
    
    var body: some View {
        NavigationStack(path: $router.navPaths) {
            mainView
                .navigationDestination(for: MusicFlow.self) { destination in
                    destination
                        .destinationView
                    /// Dynamic title based on flow
                        .navigationTitle(destination.title)
                        .toolbarRole(.editor)
                }
        }
        /// Inject router for global navigation management
        .environmentObject(router)
    }
    
    private var mainView: some View {
        VStack {
            Button("Go to first screen") {
                router.navigate(to: .first) /// IMP
            }
        }
        .navigationTitle("Musics")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MOVIE FLOW
struct MovieView: View {
    
    @StateObject private var router = MovieFlowRouter()
    
    var body: some View {
        NavigationStack(path: $router.navPaths) {
            mainView
                .navigationDestination(for: MovieFlow.self) { destination in
                    destination.destinationView
                        .navigationTitle(destination.title)
                        .toolbarRole(.editor)
                }
        }
        .environmentObject(router)
    }
    
    private var mainView: some View {
        VStack {
            Button("Go to bollywood") {
                router.navigate(to: .bollywood)
            }
        }
        .navigationTitle("Movies")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
