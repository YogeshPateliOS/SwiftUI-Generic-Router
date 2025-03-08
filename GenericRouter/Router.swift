import Foundation
import SwiftUI

/// A generic router for managing navigation between different screens in SwiftUI
protocol NavigationDestination {
    associatedtype Destination: View
    
    var title: String { get }
    @ViewBuilder
    var destinationView: Destination { get }
}

final class Router<Destination: NavigationDestination>: ObservableObject {
    
    /// Holds the stack of destinations for navigation
    @Published var navPaths: [Destination] = []
    
    func navigate(to destination: Destination) {
        navPaths.append(destination)
    }
    
    func navigateBack() {
        guard !navPaths.isEmpty else { return }
        navPaths.removeLast()
    }
    
    func navigateToRoot() {
        navPaths.removeLast(navPaths.count)
    }
    
}

/// Enum representing the music flow with associated titles for navigation
enum MusicFlow: NavigationDestination {
    /// configure your screens
    case first
    case second
    case third
    
    /// Titles for each screen in the music flow
    var title: String {
        switch self {
        case .first:
            return "First Screen - Overview of Music"
        case .second:
            return "Second Screen - Explore Genres"
        case .third:
            return "Third Screen - Final Music Choices"
        }
    }
        
    /// Destination views for each screen
    var destinationView: some View {
        switch self {
        case .first: FirstScreenView()
        case .second: SecondScreenView()
        case .third: ThirdScreenView()
        }
    }
}

typealias MusicFlowRouter = Router<MusicFlow>


