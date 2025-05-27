//
// Copyright © 2025 Tandem Diabetes Care, Inc. All rights reserved.
//

import Foundation

final class DIInstanceLocker: @unchecked Sendable {
    let lock: NSLock = NSLock()
    var locks = [String: NSLock]()

    func lock(key: String) -> NSLock {
        defer { lock.unlock() }
        lock.lock()

        guard let lock = locks[key] else {
            let lock = NSLock()
            locks[key] = lock
            return lock
        }

        return lock
    }
}
