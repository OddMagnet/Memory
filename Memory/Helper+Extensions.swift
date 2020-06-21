//
//  Helper+Extensions.swift
//  Memory
//
//  Created by Michael Brünen on 21.06.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import SwiftUI

extension Array where Element: Identifiable {
    func index(of element: Element)  -> Int {
        self.firstIndex(where: { $0.id == element.id })!
    }
}
