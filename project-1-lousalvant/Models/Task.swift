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
            Task(title: "Your Favorite Park",
                 description: "Find a park where you love to relax or play. Capture the beauty of nature or your favorite spot to unwind."),
            Task(title: "Your Study Spot",
                 description: "Show us where you hit the books! Whether it's a cozy corner in a library or a bustling café, take a photo of your go-to study place."),
            Task(title: "Local Landmark",
                 description: "Snap a picture of a well-known landmark in your area. It could be a statue, a building, or any place that's famous in your town or city.")
        ]
    }
}
