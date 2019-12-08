//
//  ReblazeReactNativeSdk
//  RNReblazeReactNativeSdk
//
//  Created by guy doron on 23/05/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

import Foundation
import ReblazeSDK;

@objc(ReblazeReactNativeSdk)
class ReblazeReactNativeSdk: NSObject {
    @objc
    func start(_ url: String, secret: String, headerName: String, headerValue: String) -> Void {
        Reblaze.start(with: url, secret: secret, header_name: headerName, header_value: headerValue, shouldShowLogs: true);
        print(url+secret+headerName+headerValue);
    }
    
    @objc
    func sendEvent(_ eventName: String) -> Void {
        Reblaze.sendEvent(eventName: eventName);
    }
    
    @objc
    static func requiresMainQueueSetup() -> Bool {
        return true
    }
}
