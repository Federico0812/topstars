//
//  ErrorViewController.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 21/04/2024.
//

import UIKit

class ErrorViewController: UIViewController {
    
    let titleLabel = UILabel()
    let errorDescriptionLabel = UILabel()
    let errorIconImageView = UIImageView()
    let retryButton = UIButton()
    let cancelButton = UIButton()

    let retryAction: Action
    let cancelAction: Action
    
    init(retryAction: @escaping Action, cancelAction: @escaping Action) {
        self.retryAction = retryAction
        self.cancelAction = cancelAction
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUp(with serviceError: ServiceError) {
        self.titleLabel.text = serviceError.displayTitle
        self.errorDescriptionLabel.text = serviceError.displayMessage
    }

}
