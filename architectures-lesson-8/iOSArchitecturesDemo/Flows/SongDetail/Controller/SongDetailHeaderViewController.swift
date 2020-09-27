//
//  SongDetailHeaderViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Vit K on 27.09.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SongDetailHeaderViewController: UIViewController {
    
    // MARK: - Properties
    
    private let song: ITunesSong
    
    private let imageDownloader = ImageDownloader()
    
    private var songDetailHeaderView: SongDetailHeaderView {
        return self.view as! SongDetailHeaderView
    }
    
    // MARK: - Init
    
    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = SongDetailHeaderView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }
    
    // MARK: - Private
    
    private func fillData() {
        self.downloadImage()
        self.songDetailHeaderView.titleLabel.text = song.trackName
        self.songDetailHeaderView.subtitleLabel.text = song.artistName
        self.songDetailHeaderView.albumLabel.text = song.collectionName
        self.songDetailHeaderView.buttonDelegate = self
    }
    
    private func downloadImage() {
        guard let url = self.song.artwork else { return }
        self.imageDownloader.getImage(fromUrl: url) { [weak self] (image, _) in
            self?.songDetailHeaderView.imageView.image = image
        }
    }
}

extension SongDetailHeaderViewController: ButtonClicked {
    func onButtonTapped() {
        let playSongViewController = PlaySongViewController()
        self.navigationController?.pushViewController(playSongViewController, animated: true)
    }
}
