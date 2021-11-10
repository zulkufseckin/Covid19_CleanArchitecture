//
//  WelcomeViewController.swift
//  covid19
//
//  Created by Z.Seckin on 2.11.2021.
//

import UIKit
import Lottie

protocol WelcomeDisplayLogic: AnyObject {
    func displayCountryList()
}

final class WelcomeViewController: UIViewController, WelcomeDisplayLogic {
    
    var interactor: WelcomeBusinessLogic?
    var router: (WelcomeRoutingLogic & WelcomeDataPassing)?
    
    let animationView = AnimationView()
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = WelcomeInteractor()
        let presenter = WelcomePresenter()
        let router = WelcomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAnimation()
        interactor?.checkForceUpdate()
    }
    
    private func setupAnimation() {
        let animation = Animation.named("virus")
        animationView.animation = animation
        animationView.frame = view.bounds
        animationView.backgroundColor = .white
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        
        view.addSubview(animationView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        animationView.stop()
    }
    
    func displayCountryList() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            self.router?.routeToCountryList()
        }
    }
    
}
