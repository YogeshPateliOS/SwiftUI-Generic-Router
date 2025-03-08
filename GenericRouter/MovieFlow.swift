import SwiftUI

enum MovieFlow: NavigationDestination {
    case bollywood
    case hollywood
    
    var title: String {
        switch self {
        case .bollywood:
            return "Bollywood"
        case .hollywood:
            return "Hollywood"
        }
    }
    
    var destinationView: some View {
        switch self {
        case .bollywood:
            BollywoodView()
        case .hollywood:
            HollywoodView()
        }
    }
}

typealias MovieFlowRouter = Router<MovieFlow>
