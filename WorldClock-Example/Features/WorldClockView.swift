//
//  ContentView.swift
//  WorldClock-Example
//
//  Created by William Boles on 05/06/2025.
//

import SwiftUI

struct WorldClockView: View {
    @ObservedObject var viewModel: WorldClockViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.continents) { continent in
                    Section(header: SectionHeaderView(title: continent.id)) {
                        ForEach(continent.locations) { location in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(location.id)
                                    .foregroundStyle(.green)
                                Text(location.dateTime)
                                    .foregroundStyle(.gray)
                            }
                            .listRowBackground(Color.clear)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .background(.black)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .onAppear() {
                viewModel.startClocks()
            }
        }
    }
}

struct SectionHeaderView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .foregroundStyle(.white)
            .font(.title)
            .fontWeight(.bold)
            .padding(.leading, 0)
    }
}

#Preview {
    WorldClockView(viewModel: WorldClockViewModel(contintents: continents))
}
