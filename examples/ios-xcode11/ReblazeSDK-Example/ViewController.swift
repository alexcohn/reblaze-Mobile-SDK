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
        NotificationCenter.default.addObserver(forName: NSNotification.Name.ReblazeErrorNotification,
                                               object: nil, queue: OperationQueue.main) { (notification) in
                                                print(notification.object)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func sendTestEvent(_ sender: Any) {
        do {
            try  Reblaze.sendEvent(eventName: "Test Custom Event")
        } catch let error {
            print((error as? LocalizedError)?.errorDescription)
        }
    }
}

