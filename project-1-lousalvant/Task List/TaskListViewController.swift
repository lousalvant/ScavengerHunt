//
//  ViewController.swift
//  project-1-lousalvant
//
//  Created by Lou-Michael Salvant on 8/29/24.
//

import UIKit

class TaskListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyStateLabel: UILabel!
    
    // Create a label for your name
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Lou Salvant - Z23637852"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()

    var tasks = [Task]() {
        didSet {
            emptyStateLabel.isHidden = !tasks.isEmpty
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // UI candy: Hide 1st / top cell separator
        tableView.tableHeaderView = UIView()

        tableView.dataSource = self

        // Populate mocked data
        // Comment out this line if you want the app to load without any existing tasks.
        tasks = Task.mockedTasks
        
        // Configure and add the name label to the view
        setupNameLabel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // This will reload data in order to reflect any changes made to a task after returning from the detail screen.
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // Segue to Compose View Controller
        if segue.identifier == "ComposeSegue" {

            // Since the segue is connected to the navigation controller that manages the ComposeViewController
            // we need to access the navigation controller first...
            if let composeNavController = segue.destination as? UINavigationController,
                // ...then get the actual ComposeViewController via the navController's `topViewController` property.
               let composeViewController = composeNavController.topViewController as? TaskComposeViewController {

                // Update the tasks array for any new task passed back via the `onComposeTask` closure.
                composeViewController.onComposeTask = { [weak self] task in
                    self?.tasks.append(task)
                }
            }

            // Segue to Detail View Controller
        } else if segue.identifier == "DetailSegue" {
            if let detailViewController = segue.destination as? TaskDetailViewController,
                // Get the index path for the current selected table view row.
               let selectedIndexPath = tableView.indexPathForSelectedRow {

                // Get the task associated with the selected index path
                let task = tasks[selectedIndexPath.row]

                // Set the selected task on the detail view controller.
                detailViewController.task = task
            }
        }
    }

    private func setupNameLabel() {
        // Add the label to the view
        view.addSubview(nameLabel)
        
        // Disable auto-resizing mask
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add constraints to position the label at the bottom
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}

extension TaskListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskCell else {
            fatalError("Unable to dequeue Task Cell")
        }

        cell.configure(with: tasks[indexPath.row])

        return cell
    }
}
