//
//  ImageDownloaded.swift
//  PokemonApp
//
//  Created by Tiago Flores on 07/02/2021.
//

import Foundation
import Kingfisher

class ImageDownloader {
    
    func downloadImage(from imageUrl: String, toImageView imageView: UIImageView) {
        
        let url = URL(string: imageUrl)
        imageView.kf.setImage(with: url,
                              placeholder: UIImage(named: "placeholder"),
                              options: [
                                .scaleFactor(UIScreen.main.scale),
                                .transition(.fade(1)),
                                .cacheOriginalImage
                              ])
        
    }
}
