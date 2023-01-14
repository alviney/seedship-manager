//
//  GameManager.swift
//  seedship-manager
//
//  Created by Alex Viney on 9/1/2023.
//

import Foundation

class GameManager {
    var timer: Timer = Timer()
    var commander: Commander = Commander()
    
    init () {
        self.timer = Timer(timeInterval: 1, repeats: true) {
           _ in self.update()
        }
        RunLoop.current.add(timer, forMode: .common)
    }
    
    @objc func update() {
        commander.update()
        PersistenceController.shared.save()
    }
}

protocol GameLoop {
    func update() -> Void
}
