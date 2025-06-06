//
//  WorldClockViewModel.swift
//  WorldClock-Example
//
//  Created by William Boles on 05/06/2025.
//

import Foundation

final class WorldClockViewModel: ObservableObject {
    @Published private(set) var continents = [ContintentViewModel]()
    
    private let contintents: [Continent]
    private var timer: Timer?
    
    // MARK: - Init
    
    init(contintents: [Continent]) {
        self.contintents = contintents
    }
    
    // MARK: - Clocks
    
    func startClocks() {
        self.timer?.invalidate()
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1,
                                          repeats: true) { [weak self] _ in
            self?.update(Date())
        }
    }
    
    private func update(_ now: Date) {
        continents = contintents.map { contintent in
            ContintentViewModel(id: contintent.name,
                                locations: contintent.locations.compactMap { location in
                guard let timezone = TimeZone(identifier: location.timezone) else {
                    return nil
                }
                
                let formatStyle = Date.FormatStyle(timeZone: timezone)
                    .year()
                    .month()
                    .day()
                    .hour()
                    .minute()
                    .second()
                let dateTime = now.formatted(formatStyle)
                
                return LocationViewModel(id: location.name,
                                         dateTime: dateTime)
            })
        }
    }
}
