//
//  BarView.swift
//  CustomBarGraph
//
//  Created by Kenny on 4/16/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import UIKit

class BarView: UIView {

    var maxVal:CGFloat {
        didSet {
            setNeedsDisplay()
        }
    }
    var value:CGFloat {
        didSet {
            setNeedsDisplay()
        }
    }

    var color: UIColor {
        didSet {
            setNeedsDisplay()
        }
    }

    init(frame: CGRect,
                  maxVal: CGFloat = 100.0,
                  value: CGFloat = 0.0,
                  color: UIColor = .blue) {
        self.maxVal = maxVal
        self.value = value
        self.color = color
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        maxVal = 100.0
        value = 0.0
        color = .blue
        super.init(coder: coder)
        setupView()
    }

    override func draw(_ rect: CGRect) {
        let pctToFill = value/maxVal
        let desiredHeight = bounds.maxY * pctToFill
        let desiredY = bounds.maxY - desiredHeight

        let view = CGRect(x: 0,
                          y: desiredY,
                          width: bounds.width,
                          height: desiredHeight)

        color.set()
        UIRectFill(view)
    }

    func setupView() {
        backgroundColor = .clear
        if frame.width > 40 {
            self.frame.size.width = 40
        }
        translatesAutoresizingMaskIntoConstraints = false
    }
}
