//
//  LocationNotificationInfo.swift
//  FirebaseStarterKit
//
//  Created by Tara Tran on 1/10/23.
//  Copyright © 2023 Instamobile. All rights reserved.
//

import CoreLocation
import UserNotifications

struct LocationNotificationInfo {
    let notificationCenter = UNUserNotificationCenter.current()

    // Identifiers
    let notificationId: String
    let locationId: String
    
    // Location
    let radius: Double
    let latitude: Double
    let longitude: Double
    
    // Notification
    let title: String
    let body: String
    let data: [String: Any]?
    
    /// CLLocation Coordinates
    var coordinates: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude,
                                      longitude: longitude)
    }
    
    
    private func makeStoreRegion() -> CLCircularRegion {
      // 2
      let region = CLCircularRegion(
        center: coordinates,
        radius: 2,
        identifier: UUID().uuidString)
      // 3
      region.notifyOnEntry = true
      // 4
      return region
    }
    
    private func registerNotification() {
      // 2
        lazy var storeRegion = makeStoreRegion()
        // 1
      let notificationContent = UNMutableNotificationContent()
      notificationContent.title = "Be careful!"
      notificationContent.body = "You are near a high traffic area right now."
      notificationContent.sound = .default

      // 3
      let trigger = UNLocationNotificationTrigger(
        region: storeRegion,
        repeats: false)

      // 4
      let request = UNNotificationRequest(
        identifier: UUID().uuidString,
        content: notificationContent,
        trigger: trigger)

      // 5
      notificationCenter
        .add(request) { error in
          if error != nil {
            print("Error: \(String(describing: error))")
          }
        }
    }

}

