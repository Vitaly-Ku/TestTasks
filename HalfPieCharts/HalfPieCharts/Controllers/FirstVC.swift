//
//  FirstVC.swift
//  HalfPieCharts
//
//  Created by Vit K on 06.08.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit
import Charts

class FirstVC: UIViewController {
    
    @IBOutlet weak var halfPieCart: PieChartView!
    @IBOutlet weak var leftStepper: UIStepper!
    @IBOutlet weak var rightStepper: UIStepper!
    
    var leftData = PieChartDataEntry(value: 20)
    var rightData = PieChartDataEntry(value: 30)
    
    var numbers = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup(pieChartView: halfPieCart)
        //        halfPieCart.chartDescription?.text = "Состояние показателя /(показатель)"
        halfPieCart.drawEntryLabelsEnabled = false
        print(halfPieCart.isDrawEntryLabelsEnabled)
                halfPieCart.transparentCircleColor = NSUIColor.white.withAlphaComponent(0.23)
                halfPieCart.holeRadiusPercent = 0.88
                halfPieCart.rotationEnabled = false
                halfPieCart.highlightPerTapEnabled = true
        halfPieCart.maxAngle = 180 // Half chart
        halfPieCart.rotationAngle = 180 // Rotate to make the half on the upper side
        //        halfPieCart.centerTextOffset = CGPoint(x: 0, y: -20)
        //        let l = halfPieCart.legend
        //        l.horizontalAlignment = .center
        //        l.verticalAlignment = .top
        //        l.orientation = .horizontal
        //        l.drawInside = false
        //        l.xEntrySpace = 7
        //        l.yEntrySpace = 0
        //        l.yOffset = 0
        //        halfPieCart.entryLabelColor = .brown
        
        leftData.value = leftStepper.value
        //        leftData.label = "левый"
        rightData.value = rightStepper.value
        //        rightData.label = "правый"
        
        numbers = [leftData, rightData]
        
        updateChartData()
        
    }
    
    @IBAction func changeLeft(_ sender: UIStepper) {
        leftData.value = sender.value
        updateChartData()
    }
    
    @IBAction func changeRight(_ sender: UIStepper) {
        rightData.value = sender.value
        updateChartData()
    }
    
    func updateChartData() {
        let chartDataSet = PieChartDataSet(entries: numbers, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        let colors = [UIColor.brown, UIColor.darkGray]
        chartDataSet.colors = colors
        halfPieCart.data = chartData
    }
    
    func setup(pieChartView chartView: PieChartView) {
//        halfPieCart.usePercentValuesEnabled = true
//        halfPieCart.drawSlicesUnderHoleEnabled = false
        //            chartView.holeRadiusPercent = 0.58
        //            chartView.transparentCircleRadiusPercent = 0.61
//        halfPieCart.chartDescription?.enabled = false
        //            chartView.setExtraOffsets(left: 5, top: 10, right: 5, bottom: 5)
                
        let paragraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.alignment = .center
        
        let text = NSMutableAttributedString(string: "Вдох")
        text.setAttributes([.font : UIFont(name: "HelveticaNeue-Light", size: 33)!,
                            .paragraphStyle : paragraphStyle, .foregroundColor : UIColor.blue], range: NSRange(location: 0, length: text.length))
        halfPieCart.centerAttributedText = text
        halfPieCart.entryLabelColor = UIColor.green
        
        halfPieCart.drawHoleEnabled = true // обрезка сердцевины круга
        halfPieCart.rotationAngle = 0
        halfPieCart.rotationEnabled = true
        halfPieCart.highlightPerTapEnabled = true
        
        
        let l = halfPieCart.legend
        l.horizontalAlignment = .right
        l.verticalAlignment = .top
        l.orientation = .vertical
        l.drawInside = false
        l.xEntrySpace = 7
        l.yEntrySpace = 0
        l.yOffset = 0
    }
    
}
