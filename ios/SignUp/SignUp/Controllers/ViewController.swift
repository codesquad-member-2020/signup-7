//
//  ViewController.swift
//  SignUp
//
//  Created by Chaewan Park on 2020/03/24.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idFieldStackView: FieldStackView!
    
    private let formTextFieldDelegate = FormTextFieldDelegate(with: FormViewModel())
    private let observers = Observers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idFieldStackView.formTextField.delegate = formTextFieldDelegate
        
        addViewUpdatingObservers()
    }
    
    deinit {
        observers.removeObservers()
    }
    
    private func addViewUpdatingObservers() {
        observers.addObserver(forName: UpdateEvent.idValidationResultDidUpdate) { [weak self] in
            guard let idEvent = $0 as? UpdateEvent else { return }
            if case let .id(result: result) = idEvent {
                switch result {
                case let .valid(message): self?.idFieldStackView.appearance = .valid(message: message.description)
                case let .invalid(error): self?.idFieldStackView.appearance = .invalid(message: error.description)
                }
            }
        }
    }
}
