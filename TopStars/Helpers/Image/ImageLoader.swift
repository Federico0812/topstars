//
//  ImageLoader.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import Foundation
import UIKit

class ImageLoader {
    @Published var image: UIImage?
    @Published var error: Error?

    private var task: URLSessionDataTask?

    func cancel() {
        task?.cancel()
        task = nil
    }

    func fetch(imageURL: URL) {
        print(imageURL)
        task = URLSession.shared.dataTask(with: imageURL) { data, _, error in
            if let error {
                self.error = error
                return
            }

            guard let data = data else { return }

            DispatchQueue.main.async { [weak self] in
                if let image = UIImage(data: data) {
                    print("LOADED: \(imageURL)")
                    self?.image = image
                } else {
                    self?.error = NSError(domain: "image error", code: -1)
                }
            }
        }
        task?.resume()
    }
}
