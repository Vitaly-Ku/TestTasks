//
//  SecondVC.swift
//  HalfPieCharts
//
//  Created by Vit K on 06.08.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    var pulsatingLayer: CAShapeLayer!
    var shapeLayer: CAShapeLayer!
    var percent = 0
    var timer: Timer!
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var button: UIButton!
    let percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "Вдох"
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()
    let lowLabel: UILabel = {
        let label = UILabel()
        label.text = "Низкая"
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()
    let highLabel: UILabel = {
        let label = UILabel()
        label.text = "Отличная"
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()
    let midLabel: UILabel = {
        let label = UILabel()
        label.text = "Хорошая"
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCircleLayers()
        setupPercentageLabel()        
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        setupPercentageLabel()
        timer = Timer.scheduledTimer(timeInterval: 0.025, target: self, selector: #selector(progressUpdate), userInfo: nil, repeats: true)
        
    }
    
    @objc func progressUpdate() {
        button.isEnabled = false
        percent += 1
        let invertedValue = Float(0 + percent) / 100
//        self.percentageLabel.text = "\(Int(invertedValue * 100))%"
        self.shapeLayer.strokeEnd = CGFloat(invertedValue)
        if percent % 33 == 0 { // до куда доходит лиия индикатор зелёная
            timer.invalidate()
//            self.percentageLabel.text = "lll"
            percent = 0
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.shapeLayer.strokeEnd = CGFloat(0)
                self.button.isEnabled = true
            }
        }
    }
    
    private func setupPercentageLabel() {
        percentageLabel.font = UIFont.boldSystemFont(ofSize: 40)
        view.addSubview(percentageLabel)
        view.addSubview(lowLabel)
        view.addSubview(highLabel)
        view.addSubview(midLabel)
        percentageLabel.frame = CGRect(x: (view.frame.width / 2) - 50, y: view.frame.height / 2 - 50, width: 100, height: 100)
        lowLabel.frame = CGRect(x: view.frame.width / 10 - 50, y: view.frame.height / 3.1 - 50, width: 100, height: 100)
        highLabel.frame = CGRect(x: view.frame.width / 1.13 - 50, y: view.frame.height / 3.1 - 50, width: 100, height: 100)
        midLabel.frame = CGRect(x: view.frame.width / 2 - 50, y: view.frame.height / 5 - 20, width: 100, height: 100)
    }
    
    private func createCircleShapeLayer(strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: view.frame.width / 2.5, startAngle: 4.7, endAngle: 3.5 * CGFloat.pi, clockwise: true)
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = view.frame.width / 100
        layer.fillColor = fillColor.cgColor
        layer.lineCap = CAShapeLayerLineCap.round
        layer.position = CGPoint.init(x: view.frame.width / 2, y: view.frame.height / 2)
        return layer
    }
    
    private func createCircle(strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {
            let layer = CAShapeLayer()
            let circularPath = UIBezierPath(arcCenter: .zero, radius: view.frame.width / 3, startAngle: 4.7, endAngle: 3.55 * CGFloat.pi, clockwise: true)
            layer.path = circularPath.cgPath
            layer.strokeColor = strokeColor.cgColor
            layer.lineWidth = view.frame.width / 30
            layer.fillColor = fillColor.cgColor
            layer.lineCap = CAShapeLayerLineCap.round
            layer.position = CGPoint.init(x: view.frame.width / 2, y: view.frame.height / 2)
            return layer
        }
    
    private func setupCircleLayers() {
        pulsatingLayer = createCircleShapeLayer(strokeColor: .clear, fillColor: UIColor.white)
        view.layer.addSublayer(pulsatingLayer)
        let trackLayer = createCircleShapeLayer(strokeColor: .darkGray, fillColor: .white)
        view.layer.addSublayer(trackLayer)
        trackLayer.strokeStart = 0.5
        trackLayer.strokeEnd = 0.99
        trackLayer.setAffineTransform(.init(rotationAngle: 1.6))
        trackLayer.fillColor = CGColor.init(srgbRed: 1, green: 1, blue: 1, alpha: 1)
        let track = createCircle(strokeColor: .darkGray, fillColor: .white)
        view.layer.addSublayer(track)

        shapeLayer = createCircleShapeLayer(strokeColor: .green, fillColor: .clear)
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
        
    }
}
