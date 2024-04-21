//
//  ErrorViewController.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 21/04/2024.
//

import UIKit
import Lottie

class ErrorViewController: UIViewController {
    
    let titleLabel = UILabel()
    let errorDescriptionLabel = UILabel()
    let animationBackgroundView = UIView()
    let retryButton = UIButton()
    let cancelButton = UIButton()
    var animationView = LottieAnimationView(name: "error")

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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpLottieAnimation()
    }
    
    func setUp(with serviceError: ServiceError) {
        self.titleLabel.text = serviceError.displayTitle
        self.errorDescriptionLabel.text = serviceError.displayMessage
    }

}
