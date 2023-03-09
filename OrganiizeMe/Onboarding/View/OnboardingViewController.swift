//
//  OnboardingViewController.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 09/03/23.
//

import UIKit
import Combine

class OnboardingViewController: UIViewController {
    
    var hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)
    
    lazy var endOnboardingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Avançar", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    init(hasSeenOnboarding: CurrentValueSubject<Bool, Never>) {
        super.init(nibName: nil, bundle: nil)
        self.hasSeenOnboarding = hasSeenOnboarding
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(endOnboardingButton)
        
        setupContraints()
    }
    
    @objc func didTapButton() {
        hasSeenOnboarding.send(true)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            endOnboardingButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            endOnboardingButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            endOnboardingButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
