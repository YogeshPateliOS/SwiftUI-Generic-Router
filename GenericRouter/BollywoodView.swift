//
//  BollywoodView.swift
//  GenericRouter
//
//  Created by Yogesh Patel on 2025-03-07.
//

import SwiftUI

struct BollywoodView: View {
    
    @EnvironmentObject var router: MovieFlowRouter
    
    var body: some View {
        VStack {
            Button("Go to hollywood") {
                router.navigate(to: .hollywood)
            }
        }
    }
}

struct HollywoodView: View {
    @EnvironmentObject var router: MovieFlowRouter
    
    var body: some View {
        VStack {
            Button("Go to Movies") {
                router.navigateToRoot()
            }
        }
    }
}

#Preview {
    BollywoodView()
}
