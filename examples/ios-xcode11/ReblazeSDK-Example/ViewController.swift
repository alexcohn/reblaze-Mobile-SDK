//
//  ViewController.swift
//  ReblazeSDK-Example
//
//  Created by Rotem Doron on 06/05/2019.
//  Copyright © 2019 Moblers. All rights reserved.
//

import UIKit
import ReblazeSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func sendTestEvent(_ sender: Any) {
        Reblaze.sendEvent(eventName: "Test Custom Event")
    }

}

