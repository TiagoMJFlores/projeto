//
//  ImageDownloader.swift
//  PokemonAppTests
//
//  Created by Tiago Flores on 07/02/2021.
//

import UIKit

@testable import PokemonApp

class ImageDownloaderStub: ImageDownloader {
    
    var image: UIImage?
   
    override func downloadImage(from imageUrl: String, toImageView imageView: UIImageView) {
        imageView.image = image
    }
}
