//
//  GCDBlackBox.swift
//  On The Map
//
//  Created by Zulwiyoza Putra on 1/16/17.
//  Copyright © 2017 zulwiyozaputra. All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}

func executeWithDelay(timeInSecond: Double, _ updates: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + timeInSecond, execute: {
        updates()
    })
}
