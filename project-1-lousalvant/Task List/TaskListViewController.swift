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
        tableView.delegate = self  // Set the delegate here

        // Populate mocked data
        // Comment out this line if you want the app to load without any existing tasks.
        tasks = Task.mockedTasks
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // This will reload data in order to reflect any changes made to a task after returning from the detail screen.
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            if let detailViewController = segue.destination as? TaskDetailViewController,
               let selectedIndexPath = tableView.indexPathForSelectedRow {

                // Get the task associated with the selected index path
                let task = tasks[selectedIndexPath.row]

                // Set the selected task on the detail view controller.
                detailViewController.task = task
            }
        }
    }
}

// Conform to UITableViewDataSource
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

// Conform to UITableViewDelegate
extension TaskListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect the row with animation
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Trigger the segue to navigate to the detail view controller
        performSegue(withIdentifier: "DetailSegue", sender: self)
    }
}
