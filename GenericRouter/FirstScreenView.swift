//
//  FirstScreenView.swift
//  GenericRouter
//
//  Created by Yogesh Patel on 2025-03-07.
//

import SwiftUI

struct FirstScreenView: View {
    
    @EnvironmentObject var router: MusicFlowRouter
    
    var body: some View {
        VStack {
            Button("Go to Second Screen") {
                router.navigate(to: .second)
            }
        }
    }
}

struct SecondScreenView: View {
    @EnvironmentObject var router: MusicFlowRouter

    var body: some View {
        VStack {
            Button("Go to third Screen") {
                router.navigate(to: .third)
            }
        }
    }
}

struct ThirdScreenView: View {
    @EnvironmentObject var router: MusicFlowRouter

    var body: some View {
        VStack {
            Button("Go to Home") {
                router.navigateToRoot()
            }
        }
    }
}
//
//
//#Preview {
//    FirstScreenView()
//}
