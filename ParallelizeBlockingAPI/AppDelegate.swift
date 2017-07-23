//
//  AppDelegate.swift
//  ParallelizeBlockingAPI
//
//  Created by Vincent on 21/07/2017.
//  Copyright © 2017 Vincent Pradeilles. All rights reserved.
//

import Cocoa
import RxSwift
import RxBlocking

func print(_ timeInterval: TimeInterval) {
    print(String(format: "%.3f sec", timeInterval))
}

func time(_ message: String = "", _ code: () -> Void) {
    let startTime = Date()
    code()
    print(message)
    print(Date().timeIntervalSince(startTime))
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        let user = User()
        
        time("Blocking API time :") {
            _ = BlockingOrchestration.getShippingStatus(for: user)
        }
        
        let parallelStartTime = Date()
        _ = ParallelOrchestration.getShippingStatus(for: user)
            .subscribe(onCompleted: {
                print("Parallel API time :")
                print(Date().timeIntervalSince(parallelStartTime))
        })
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

