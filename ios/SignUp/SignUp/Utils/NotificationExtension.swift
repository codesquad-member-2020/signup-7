//
//  NotificationExtension.swift
//  SignUp
//
//  Created by Chaewan Park on 2020/03/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

extension NotificationCenter {
    func addObserver(forName name: Notification.Name,
                     using block: @escaping (Any?) -> Void) -> NSObjectProtocol {
        return addObserver(forName: name, object: nil, queue: .main) { block($0.object) }
    }
}
