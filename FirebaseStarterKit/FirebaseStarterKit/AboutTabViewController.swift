//
//  AboutTabViewController.swift
//  FirebaseStarterKit
//
//  Created by Tara Tran on 1/13/23.
//  Copyright © 2023 Instamobile. All rights reserved.
//

import UIKit

class AboutTabViewController: UIViewController {
    @IBOutlet var homeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension AboutTabViewController {
    @IBAction func unwindHome(segue: UIStoryboardSegue) {
    }
  }
  
