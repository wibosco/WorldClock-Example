//
//  WorldClock_ExampleApp.swift
//  WorldClock-Example
//
//  Created by William Boles on 05/06/2025.
//

import SwiftUI

@main
struct WorldClock_ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            WorldClockView(viewModel: WorldClockViewModel(contintents: continents))
        }
    }
}

struct Continent {
    let name: String
    let locations: [Location]
}

struct Location {
    let name: String
    let timezone: String
}

let continents: [Continent] = [
    .init(name: "America", locations: [
        .init(name: "New York", timezone: "America/New_York"),
        .init(name: "São Paulo", timezone: "America/Sao_Paulo"),
        .init(name: "Denver", timezone: "America/Denver"),
        .init(name: "Buenos Aires", timezone: "America/Argentina/Buenos_Aires"),
    ]),
    .init(name: "Europe", locations: [
        .init(name: "London", timezone: "Europe/London"),
        .init(name: "Paris", timezone: "Europe/Paris"),
        .init(name: "Moscow", timezone: "Europe/Moscow"),
        .init(name: "Lisbon", timezone: "Europe/Lisbon"),
    ]),
    .init(name: "Asia", locations: [
        .init(name: "Dubai", timezone: "Asia/Dubai"),
        .init(name: "Tokyo", timezone: "Asia/Tokyo"),
        .init(name: "Seoul", timezone: "Asia/Seoul"),
        .init(name: "Singapore", timezone: "Asia/Singapore"),
    ]),
    .init(name: "Oceania", locations: [
        .init(name: "Auckland", timezone: "Pacific/Auckland")
    ])
]
