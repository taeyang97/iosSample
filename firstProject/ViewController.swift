//
//  ViewController.swift
//  firstProject
//
//  Created by 김태양 on 2023/08/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView!
    let items = ["imgVC", "DatePickerVC", "PickerVC", "AlertVC"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create and configure the table view
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)

        // Set constraints for the table view
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // Register a cell class or cell nib if needed
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - UITableViewDataSource methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }

    // MARK: - UITableViewDelegate method

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let selectedItem = items[indexPath.row]

            // Determine the appropriate identifier based on the selected item
            var identifier: String
            switch selectedItem {
                case "imgVC":
                    identifier = "imgVC"
                case "DatePickerVC":
                    identifier = "DatePickerVC"
                case "PickerVC":
                    identifier = "PickerVC"
                case "AlertVC":
                    identifier = "AlertVC"
                default:
                    return
            }

            // Call the navigateToViewController function with the identifier
            navigateToViewController(withIdentifier: identifier)
    }

    // Function to navigate to the selected view controller
    func navigateToViewController(withIdentifier identifier: String) {
        // Instantiate the view controller from the storyboard
        if let viewController = storyboard?.instantiateViewController(withIdentifier: identifier) {
            // Present the selected view controller modally
            present(viewController, animated: true, completion: nil)
        }
    }}

