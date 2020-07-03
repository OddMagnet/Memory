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

let halloween = Theme(name: "Halloween", emojis: ["👻","🎃","🕷","👺","🍬","🍭","💀","🧠","👁"],
                      numberOfPairsToShow: nil, color: .orange)

let gaming = Theme(name: "Gaming", emojis: ["🎮","🕹","🎳","🎰","👾","🎲","🤖","🏈","🏓","🖥","💻"],
                   numberOfPairsToShow: 5, color: .blue)

let animals = Theme(name: "Animals", emojis: ["🐶","🐱","🐭","🐹","🐰","🦊","🐼","🐨","🐯","🦁","🐮","🐸","🐵","🐤"],
                    numberOfPairsToShow: 5, color: .yellow)

let christmas = Theme(name: "Christmas", emojis: ["🤶🏻","🎅🏻","🎄","⛄️","☃️","❄️","🎁"],
                      numberOfPairsToShow: 5, color: .red)

let food = Theme(name: "Food", emojis: ["🍏","🍐","🍊","🍌","🍋","🍉","🍇","🍓","🍒","🥦","🥕","🧀","🥞","🥩","🍔","🍕"],
                 numberOfPairsToShow: 5, color: .purple)

let vehicles = Theme(name: "Vehicles", emojis: ["🚗","🚎","🏎","🚓","🚑","🚒","🚜","🚂","✈️","🚀","🛸","🚁","⛵️","🛳","🛶"],
                     numberOfPairsToShow: 5, color: .pink)

let faces = Theme(name: "Faces", emojis: ["😀","😅","🤣","😇","😉","😍","😘","😝","🤪","😎","😡","😳","🥶","🤢",],
                  numberOfPairsToShow: 5, color: .green)
