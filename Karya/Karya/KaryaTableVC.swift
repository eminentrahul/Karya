//
//  ViewController.swift
//  Karya
//
//  Created by Rahul Ravi Prakash on 22/05/20.
//  Copyright © 2020 Rahul Ravi Prakash. All rights reserved.
//

//https://colorhunt.co/palette/2763

import UIKit

class KaryaTableVC: UITableViewController {
	
	var karyaItemArray = ["A", "B", "C"]
	
	let defaults = UserDefaults.standard

	override func viewDidLoad() {
		super.viewDidLoad()
		
		if let items = defaults.array(forKey: "KaryaItems") as?  [String] {
			
			karyaItemArray = items;
		}
	}
	
	//MARK - Tableview Data source Method
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return karyaItemArray.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "KaryaItemCell", for: indexPath)
		
		cell.textLabel?.text = karyaItemArray[indexPath.row]
		
		return cell
	}
	
	//MARK - Tableview delegate methods
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		tableView.deselectRow(at: indexPath, animated: true)
		tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
	}

	@IBAction func addKaryaItemClicked(_ sender: UIBarButtonItem) {
		
		var textField = UITextField()
		
		let alert = UIAlertController(title: "Add New Karya Item", message: "", preferredStyle: .alert)
		
		let action = UIAlertAction(title: "Add Karya", style: .default) { (action) in
			//Handle on ok click
			self.karyaItemArray.append(textField.text ?? "New Karya")
			
			self.defaults.set(self.karyaItemArray, forKey: "KaryaItems")
			
			self.tableView.reloadData()
		}
		
		alert.addAction(action)
		
		alert.addTextField { (alertTextField) in
			
			alertTextField.placeholder = "Create New Karya"
			textField = alertTextField
		}
		
		self.present(alert, animated: true, completion: nil)
		
	}
	
}

