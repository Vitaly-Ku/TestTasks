//
//  AppDetailVersionViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Vit K on 27.09.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class AppDetailVersionViewController: UIViewController {
    
    // MARK: - Properties
    
    private let app: ITunesApp
    
    private var appDetailVersionView: AppDetailVersionView {
        return self.view as! AppDetailVersionView
    }
    
    // MARK: - Init
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = AppDetailVersionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }
    
    // MARK: - Private
    
    private func fillData() {
        self.appDetailVersionView.titleLabel.text = "Что нового"
        self.appDetailVersionView.versionLabel.text = "Версия \(app.version ?? "1.0")"
        self.appDetailVersionView.descriptionLabel.text = app.releaseNotes
    }
    
}

