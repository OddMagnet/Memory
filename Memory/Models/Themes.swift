//
//  Themes.swift
//  Memory
//
//  Created by Michael Brünen on 03.07.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import SwiftUI

struct Theme {
    let name: String
    var emojis: [String]
    var numberOfPairsToShow: Int?
    let color: Color
}

let themes = [halloween, gaming, animals, christmas, food, vehicles, faces]

let halloween = Theme(name: "Halloween", emojis: ["👻", "🎃", "🕷", "🕸", "🦇", "💀", "👽", "🧙", "🧝", "🧛", "🧟", "👺", "🍬", "🍭", "🧠", "😈"],      // 15
                      numberOfPairsToShow: nil, color: .orange)

let gaming = Theme(name: "Gaming", emojis: ["🎮", "🕹", "🎳", "🎰", "👾", "🎲", "🤖", "🏈", "🏓", "🖥", "🎯", "🃏", "♟", "🀄️", "⚽️"],                   // 15
                   numberOfPairsToShow: 5, color: .blue)

let animals = Theme(name: "Animals", emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐼", "🐨", "🐯", "🦁", "🐮", "🐸", "🐵", "🐤", "🐋"],                // 15
                    numberOfPairsToShow: 5, color: .yellow)

let christmas = Theme(name: "Christmas", emojis: ["🤶🏻", "🎅🏻", "🎄", "⛄️", "☃️", "❄️", "🎁", "⛪️", "🌨", "🥶", "🏂", "🥳", "🎉", "⛷", "🌲"],            // 15
                      numberOfPairsToShow: 5, color: .red)

let food = Theme(name: "Food", emojis: ["🍏", "🍐", "🍊", "🍌", "🍋", "🍉", "🍇", "🍓", "🍒", "🥦", "🥕", "🧀", "🥞", "🍔", "🍕"],                      // 15
                 numberOfPairsToShow: 5, color: .purple)

let vehicles = Theme(name: "Vehicles", emojis: ["🚗", "🚎", "🏎", "🚓", "🚑", "🚒", "🚜", "🚂", "✈️", "🚀", "🛸", "🚁", "⛵️", "🛳", "🛶"],              // 15
                     numberOfPairsToShow: 5, color: .pink)

let faces = Theme(name: "Faces", emojis: ["😀", "😅", "🤣", "😇", "😉", "😍", "😘", "😝", "🤪", "😎", "😡", "😳", "🥶", "🤢", "👹"],                    // 15
                  numberOfPairsToShow: 5, color: .green)
