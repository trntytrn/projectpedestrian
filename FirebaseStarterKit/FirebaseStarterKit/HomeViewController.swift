//
//  HomeViewController.swift
//  FirebaseStarterKit
//
//  Created by Tara Tran on 1/17/23.
//  Copyright © 2023 Instamobile. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var mapPageButton: UIButton!
    @IBOutlet var aboutPageButton: UIButton!
    @IBOutlet var settingsPageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func openMap(sender: AnyObject) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"MapViewController")
            self.present(vc, animated: true, completion: nil);
    }
    
    @IBAction func openAbout(sender: AnyObject) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"AboutViewController")
            self.present(vc, animated: true, completion: nil);
    }
    @IBAction func openSettings(sender: AnyObject) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"SettingsViewController")
            self.present(vc, animated: true, completion: nil);
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

