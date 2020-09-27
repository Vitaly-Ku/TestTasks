//
//  SearchSongRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Vit K on 27.09.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SearchSongRouter: SearchSongRouterInput {
    
    weak var viewController: UIViewController?
    
    func openDetails(for song: ITunesSong) {
        let songDetaillViewController = SongDetailViewController(song: song)
        self.viewController?.navigationController?.pushViewController(songDetaillViewController, animated: true)
    }
    
    func openSongInITunes(_ song: ITunesSong) {
        guard let urlString = song.artistName, let url = URL(string: urlString) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

protocol SearchSongRouterInput {
    
    func openDetails(for app: ITunesSong)
    
    func openSongInITunes(_ app: ITunesSong)
}
