//
//  SettingsTabViewController.swift
//  FirebaseStarterKit
//
//  Created by Tara Tran on 1/13/23.
//  Copyright © 2023 Instamobile. All rights reserved.
//

import UIKit

class SettingsTabViewController: UIViewController {
    @IBOutlet var popButton: UIButton!
    @IBOutlet var settingsButton: UIButton!
    @IBOutlet var homeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    @IBAction func showPopUp(_ sender: Any) {
        let alert = UIAlertController(title: "Test Notification", message: "It works! A notification similar to this will pop up if you are in the radius of a high traffic area.", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Confirm", style: .default) { (action) in
            print(action)
        }
        alert.addAction(okayAction)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func showSettings(_ sender: Any) {
        let alertController = UIAlertController (title: "Ensure Location and Notifications are allowed", message: "Go to Settings > Project Pedestrian. Set Location to Always Allow and Notifcations to Allow.", preferredStyle: .alert)

        let settingsAction = UIAlertAction(title: "Open Settings", style: .default) { (_) -> Void in

            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }

            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    print("Settings opened: \(success)") // Prints true
                })
            }
        }
        alertController.addAction(settingsAction)
        let cancelAction = UIAlertAction(title: "Done", style: .default, handler: nil)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension SettingsTabViewController {
    @IBAction func unwindHome(segue: UIStoryboardSegue) {
    }
  }
  
