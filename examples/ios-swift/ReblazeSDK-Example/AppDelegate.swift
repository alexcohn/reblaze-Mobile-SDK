//
//  ReblazeSDK-Example
//
//  Created by Rotem Doron on 06/05/2019.
//  Copyright © 2019 Reblaze. All rights reserved.
//

import SwiftUI
import ReblazeSDK

let sessionToken = "\(arc4random())"

@main
struct SDK_Example: App {

    init() {
        reblaze.setEventListener() { kind, message in
            guard kind >= reblaze.Kind.INFO else { return }
            print("reblaze", kind.description, message)
        }

        reblaze.token = sessionToken
        print("reblaze hash", reblaze.generateHash()) // Call get hash even before backendUrl is defined

        reblaze.autoSign = reblaze.AutoSign.ALL
        reblaze.backendUrl = "https://fire-gcp-lb.rbzdevsdk001.dev.rbzdns.com" // TODO: not to commit to public repo
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var backendUrl: String = reblaze.backendUrl
    @State private var isEditing = false

    var body: some View {
        VStack(spacing: 10.0) {
            Text("Reblaze Mobile SDK v\(ReblazeSDKVersionNumber)")
            HStack {
                Text(" backendUrl")
                TextField(
                    "",
                    text: $backendUrl
                ) { isEditing in
                    self.isEditing = isEditing
                } onCommit: {
                    reblaze.backendUrl = backendUrl
                }
                .autocapitalization(.none)
                .keyboardType(.URL)
                .disableAutocorrection(true)
                .border(Color(UIColor.separator))
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            Button(action: {
                let url = URL(string: ("\(reblaze.backendUrl)/signed"))!
                var request = URLRequest(url: url)
                request.setValue(reblaze.generateHash(), forHTTPHeaderField: "rbzsdk")
                request.setValue(sessionToken, forHTTPHeaderField: "authorization")
                let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
                    if let httpResponse = response as? HTTPURLResponse {
                        print("Reply: \(httpResponse.statusCode)")
                    }
                    else {
                        print("Reply: \(String(describing: response))")
                    }
                }
                task.resume()
            }, label: {
                Text("send a signed network request")
            })
            Button(action: {
                let url = URL(string: ("\(reblaze.backendUrl)/unsigned"))!
                let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                    if let httpResponse = response as? HTTPURLResponse {
                        print("Reply: \(httpResponse.statusCode)")
                    }
                    else {
                        print("Reply: \(String(describing: response))")
                    }
                }
                task.resume()
            }, label: {
                Text("send an auto-signed network request")
            })
            Button(action: {
                reblaze.sendEvent("button pressed")
            }, label: {
                Text("generate custom Reblaze event")
            })
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
