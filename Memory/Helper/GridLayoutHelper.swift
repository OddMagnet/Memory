//
//  GridLayoutHelper.swift
//  Memory
//
//  Created by Michael Brünen on 21.06.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import SwiftUI

// 'helper' struct for the size constraints in the grid
struct GridLayout {
    var size: CGSize
    var rowCount: Int = 0
    var columnCount: Int = 0
    
    init(itemCount: Int, nearAspectRatio desiredAspectRatio: Double = 1, in size: CGSize) {
        self.size = size

        // ensure that there is some width and height to work with and there is 1 or more items
        guard size.width != 0, size.height != 0, itemCount > 0 else { return }
        
        // find the best layout, default has 1 row and as many columns as items
        var bestLayout: (rowCount: Int, columnCount: Int) = (1, itemCount)
        var smallestVariance: Double?
        let sizeAspectRatio = abs(Double(size.width/size.height))
        
        // check all possible row combination from 1 row to as many rows as items
        for rows in 1...itemCount {
            // calculate the columns needed for the rows amount
            // if items can't be evenly distributed add one extra column
            let columns = (itemCount / rows) + (itemCount % rows > 0 ? 1 : 0)
            
            // ensure there are no empty rows
            if (rows - 1) * columns < itemCount {
                // calculate the aspect ratio for the items in the given CGSize's aspect ratio
                let itemAspectRatio = sizeAspectRatio * (Double(rows)/Double(columns))
                // temporarily save the absolute variance
                let variance = abs(itemAspectRatio - desiredAspectRatio)
                // and check if against the so far smallest variance
                if smallestVariance == nil || variance < smallestVariance! {
                    // if a new smallest variance is found, set it as smallest again
                    smallestVariance = variance
                    // and set the bestLayout for it
                    bestLayout = (rowCount: rows, columnCount: columns)
                }
            }
        }
        // after all combinations were tested, get the best possible rowCount and columnCount combination
        rowCount = bestLayout.rowCount
        columnCount = bestLayout.columnCount
    }
    
    var itemSize: CGSize {
        if rowCount == 0 || columnCount == 0 {
            return CGSize.zero
        } else {
            return CGSize(
                width: size.width / CGFloat(columnCount),
                height: size.height / CGFloat(rowCount)
            )
        }
    }
    
    func location(ofItemAt index: Int) -> CGPoint {
        if rowCount == 0 || columnCount == 0 {
            return CGPoint.zero
        } else {
            return CGPoint(
                x: (CGFloat(index % columnCount) + 0.5) * itemSize.width,
                y: (CGFloat(index / columnCount) + 0.5) * itemSize.height
            )
        }
    }
}

