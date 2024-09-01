//
//  TaskComposeViewController.swift
//  project-1-lousalvant
//
//  Created by Lou-Michael Salvant on 9/1/24.
//

import UIKit

class TaskComposeViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!

    // When a new task is created, this closure is called, passing in the newly created task.
    var onComposeTask: ((Task) -> Void)? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func didTapDoneButton(_ sender: Any) {

        guard let title = titleField.text,
              let description = descriptionField.text,
              !title.isEmpty,
              !description.isEmpty else {
            presentEmptyFieldsAlert()
            return
        }

        let task = Task(title: title, description: description)
        onComposeTask?(task)
        dismiss(animated: true)
    }

    
    @IBAction func didTapCancelButton(_ sender: Any) {
        dismiss(animated: true)
    }

    private func presentEmptyFieldsAlert() {
        let alertController = UIAlertController(
            title: "Oops...",
            message: "Both title and description fields must be filled out",
            preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)

        present(alertController, animated: true)
    }
}
