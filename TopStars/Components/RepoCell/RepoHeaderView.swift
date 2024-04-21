//
//  RepoHeaderView.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import UIKit
import Combine

class RepoHeaderView: UIView {
    
    let titleLabel = UILabel()
    let urlLabel = UILabel()
    let iconImageView = UIImageView()
    
    private var subscribers: [AnyCancellable] = []
    private let imageLoader = ImageLoader()
    
    init() {
        super.init(frame: .zero)
        setUpSubscribers()
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpSubscribers() {
        imageLoader.$image.sink { image in
            self.iconImageView.image = image
        }.store(in: &subscribers)
    }
    
    func setUp(with repoItem: RepoItem) {
        titleLabel.text = repoItem.name
        urlLabel.text = repoItem.fullName
        if let imageUrl = URL(string: repoItem.owner.avatarUrl) {
            loadImage(with: imageUrl)
        }
    }
    
    func loadImage(with imageUrl: URL) {
        imageLoader.cancel()
        imageLoader.fetch(imageURL: imageUrl)
    }
}
