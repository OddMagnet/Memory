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

let halloween = Theme(name: "Halloween", emojis: ["👻", "🎃", "🕷", "🕸", "🦇", "💀", "👽", "🧙", "🧝", "🧛", "🧟", "👺", "🍬", "🍭", "🧠", "😈", "🤖"], // 16
                      numberOfPairsToShow: 16, color: .orange)

let gaming = Theme(name: "Gaming", emojis: ["🎮", "🕹", "🎳", "👾", "🎲", "🤖", "🏈", "🏓", "🖥", "🎯", "🃏", "♟", "⚽️", "♣️", "♦️", "♠️"],              // 16
                   numberOfPairsToShow: 16, color: .blue)

let animals = Theme(name: "Animals", emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐼", "🐨", "🐯", "🦁", "🐮", "🐸", "🐵", "🐤", "🐋", "🦔"],          // 16
                    numberOfPairsToShow: 16, color: .yellow)

let christmas = Theme(name: "Christmas", emojis: ["🤶🏻", "🎅🏻", "🎄", "☃️", "❄️", "🎁", "⛪️", "🌨", "🥶", "🏂", "🥳", "🎉", "⛷", "😇", "🛍", "💫"],       // 16
                      numberOfPairsToShow: 16, color: .red)

let food = Theme(name: "Food", emojis: ["🍏", "🍐", "🍊", "🍌", "🍋", "🍉", "🍇", "🍓", "🍒", "🥦", "🥕", "🧀", "🥞", "🍔", "🍕", "🥝"],                 // 16
                 numberOfPairsToShow: 16, color: .purple)

let vehicles = Theme(name: "Vehicles", emojis: ["🚗", "🚎", "🏎", "🚓", "🚑", "🚒", "🚜", "🚂", "✈️", "🚀", "🛸", "🚁", "⛵️", "🛳", "🛶", "🚲"],         // 16
                     numberOfPairsToShow: 16, color: .pink)

let faces = Theme(name: "Faces", emojis: ["😀", "😅", "🤣", "😇", "😉", "😍", "😘", "😝", "🤪", "😎", "😡", "😳", "🥶", "🤢", "👹", "💩"],               // 16
                  numberOfPairsToShow: 16, color: .green)
