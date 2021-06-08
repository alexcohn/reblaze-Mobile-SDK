//
//  ReblazeSDK-Example
//
//  Created by Rotem Doron on 06/05/2019.
//  Copyright © 2019 Reblaze. All rights reserved.
//

import SwiftUI
import ReblazeSDK

@main
struct SDK_Example: App {

    init() {
        reblaze.setEventListener() { kind, message in
            guard kind.greaterOrEqual(reblaze.Kind.INFO) else { return } // TODO: change to >= after lib upgrade
            print("reblaze", kind.description, message)
        }

        reblaze.uid = "\(arc4random())" // this will be our "session token"
        print("reblaze hash", reblaze.generateHash()) // Call get hash even before backendUrl is defined

        reblaze.autoSign = true
        reblaze.backendUrl = "https://fire-gcp-lb.mobilesdkdev.d1.rbzdns.com" // TODO: not to commit to public repo
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        Button(action: {
            reblaze.sendEvent("button pressed")
        }, label: {
            Text("Button")
        })
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
