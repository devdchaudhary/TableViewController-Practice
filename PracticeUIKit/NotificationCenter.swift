//
//  NotificationCenter.swift
//  PracticeUIKit
//
//  Created by devdchaudhary on 23/02/23.
//

import UIKit

class CustomNotificationCenter {
    
    //MARK: Notification Center
    
    private static var notificationCenter: NotificationCenter {
        return NotificationCenter.default
    }
    
    //MARK: Post Notifications

    /// Post the specified notification with the given object

    static func postNotification(_ name: String, object: AnyObject? = nil) {
        notificationCenter.post(name: .init(name), object: object)
    }
    
    /// Observe the NSNotification with the specified name
    static func observeNotification(_ observer: AnyObject, selector: Selector, name: String, object: AnyObject? = nil) {
        notificationCenter.addObserver(observer, selector: selector, name: .init(name), object: object)
    }
    
    
}
