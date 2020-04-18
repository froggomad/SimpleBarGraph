//
//  DataSet.swift
//  CustomBarGraph
//
//  Created by Kenny on 4/16/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import UIKit

/**
Used to setup a BarView

 - parameter maxVal: The graph's maximum value
 - parameter maxVal: The graph's current value
 - parameter color: The color of the BarView's fill

 */

struct DataSet: Equatable {
    var maxVal: CGFloat
    var value: CGFloat
    var color: UIColor
    var id: UUID = UUID()
}
