//
//  Shadow.swift
//  HalfPieCharts
//
//  Created by Vit K on 13.08.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit

class Shadow: UILabel {
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    var shadowLayer: CAShapeLayer {
        return self.layer as! CAShapeLayer
    }
    
    
    @IBInspectable var color: UIColor = .black {
        didSet { self.updateColors() }
    }
    @IBInspectable var opacity: CGFloat = 1 {
        didSet { self.updateOpacity() }
    }
    @IBInspectable var radius: CGFloat = 7 {
        didSet { self.udateRadius() }
    }
    @IBInspectable var offset: CGSize = .zero {
        didSet { self.updateOffset() }
    }
    
    
    
    func updateColors() {
        self.shadowLayer.shadowColor = self.color.cgColor
    }
    func updateOpacity() {
        self.shadowLayer.shadowOpacity = Float(self.opacity)
    }
    func udateRadius() {
        self.shadowLayer.shadowRadius = self.radius
    }
    func updateOffset() {
        self.shadowLayer.shadowOffset = offset
    }
}
