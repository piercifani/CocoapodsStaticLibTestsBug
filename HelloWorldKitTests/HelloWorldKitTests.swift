//
//  HelloWorldKitTests.swift
//  HelloWorldKitTests
//
//  Created by Pierluigi Cifani on 16/04/2018.
//  Copyright © 2018 Pierluigi Cifani. All rights reserved.
//

import XCTest
import RxSwift

@testable import HelloWorldKit

class HelloWorldKitTests: XCTestCase {
    
    func testExample() {

        let scheduler = SerialDispatchQueueScheduler(qos: .default)
        let subscription = Observable<Int>.interval(0.3, scheduler: scheduler)
            .subscribe { event in
                print(event)
        }

        Thread.sleep(forTimeInterval: 2.0)

        subscription.dispose()

    }

}
