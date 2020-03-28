//
//  ViewController.swift
//  SignUp
//
//  Created by Chaewan Park on 2020/03/24.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idTextField: IDTextField!
    
    private let formTextFieldDelegate = FormTextFieldDelegate(with: FormViewModel())
    private let observers = Observers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idTextField.delegate = formTextFieldDelegate
        
        addViewUpdatingObservers()
    }
    
    deinit {
        observers.removeObservers()
    }
    
    private func addViewUpdatingObservers() {
        observers.addObserver(forName: UpdateEvent.idValidationResultDidUpdate) { [weak self] in
            guard let _ = $0 as? UpdateEvent else { return }
            self?.idTextField.appearance = .invalid
        }
    }
}
