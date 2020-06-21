//
//  GridView.swift
//  Memory
//
//  Created by Michael Brünen on 21.06.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import SwiftUI

struct GridView<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            // calling a body function so a layout argument can be passed
            // since creating a layout variable is not possible in a GeometryReader (ViewBuilder)
            self.body(for: GridLayout(itemCount: self.items.count,
                                      nearAspectRatio: 2/3,
                                      in: geometry.size)
            )
        }
    }
    
    // place the view for each item with a fitting frame at the right position
    func body(for layout: GridLayout) -> some View {
        ForEach(self.items) { item in
            self.viewForItem(item)
                .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                .position(layout.location(ofItemAt: self.items.index(of: item)!))
        }
    }

}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
