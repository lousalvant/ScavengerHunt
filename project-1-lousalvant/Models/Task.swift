//
//  Task.swift
//  project-1-lousalvant
//
//  Created by Lou-Michael Salvant on 8/30/24.
//

import UIKit
import CoreLocation

class Task {
    let title: String
    let description: String
    var image: UIImage?
    var imageLocation: CLLocation?
    var isComplete: Bool {
        image != nil
    }

    init(title: String, description: String) {
        self.title = title
        self.description = description
    }

    func set(_ image: UIImage, with location: CLLocation) {
        self.image = image
        self.imageLocation = location
    }
}

extension Task {
    static var mockedTasks: [Task] {
        return [
            Task(title: "Your favorite restaurant",
                 description: "Let us know where your favorite place to eat is!"),
            Task(title: "Your school",
                 description: "Let us know where your school is!"),
            Task(title: "Your home",
                 description: "Let us know where you live!")
        ]
    }
}
