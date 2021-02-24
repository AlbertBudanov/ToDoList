//
//  TasksViewController.swift
//  ToDoList
//
//  Created by Альберт on 24.02.2021.
//

import UIKit
import Firebase

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .clear
        cell.textLabel?.text = "This is cell number \(indexPath.row)"
        cell.textLabel?.textColor = .white
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addTapped(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "New task", message: "Add new task", preferredStyle: .alert)
        alertController.addTextField()
        let save = UIAlertAction(title: "Save", style: .default) { _ in
            guard let textField = alertController.textFields?.first,
                  textField.text != "" else { return } }
            
//            let task
//            taskRef
//            task
            let cancel = UIAlertAction(title: "Cansel", style: .default, handler: nil)
            alertController.addAction(save)
        alertController.addAction(cancel)
            
            
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func sugnOutTapped(_ sender: UIBarButtonItem) {
        do {
            try Firebase.Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        dismiss(animated: true, completion: nil)
    }
     
}
