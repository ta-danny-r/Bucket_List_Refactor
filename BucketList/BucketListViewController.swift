//
//  BucketListViewController.swift
//  BucketList
//
//  Created by Danny on 10/13/21.
//

import UIKit

// REMINDER! On line 15, we are inheriting from AddItemTableViewControllerDelegate
// so we are REQUIRED to add these functions
// func cancelButtonPressed(by controller: AddItemTableViewController)
// func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?)
// REMINDER!!: The parameters from cancelButtonPressed() and itemSaved() are getting PASSED AROUND during the DELEGATION phase.

class BucketListViewController: UITableViewController, AddItemTableViewControllerDelegate {

    var items = ["Go to the moon", "Eat a candy bar", "Swim in the Amazon", "Ride a motorcycle in Tokyo"]
    
    
    @IBAction func onAddPressed(_ sender: UIBarButtonItem) {
        // performSegue() Initiates the segue with the specified identifier from the current view controller's storyboard file.
        // performSegue() functions calls the prepare() function
        // In this case we pass in the identifier "EditItemSegue" and sender (UIBarButtonItem) to the prepare() function
        performSegue(withIdentifier: "EditItemSegue", sender: sender)
    }
    
    // viewDidLoad function is part of the View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count // return the number of rows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath) // dequeue the cell from our storyboard
        // All UITableViewCell objects have a build in textLabel so set it that it corresponds to the row in array
        cell.textLabel?.text = items[indexPath.row]
        return cell // return cell so that Table View knows what to draw in each row
    }
    
    /*
     didSelectRowAt listens when the user selects a row in a table view
    */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // performSegue() Initiates the segue with the specified identifier from the current view controller's storyboard file.
        // performSegue() functions calls the prepare() function
        // In this case we pass in the identifier "EditItemSegue" and sender (IndexPath) to the prepare() function
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    
    // Tells the delegate that the user tapped the detail button for the specified row
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        // performSegue() Initiates the segue with the specified identifier from the current view controller's storyboard file.
        // performSegue() functions calls the prepare() function
        // In this case we pass in the identifier "EditItemSegue" and sender (IndexPath) to the prepare() function
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    
    
    // Asks the data source to delete a specified row from table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)  // remove row from array
        tableView.reloadData() // reload data for table view
    }
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // REMINDER!!: We only have one identifier in our Storyboard called "EditItemSegue"
        // We need to check who is the sender.
        // Is the sender an UIBarButtonItem or an IndexPath? This is why we are using an IF statement.
        if sender is UIBarButtonItem {  // if sender is a UIBarButtonItem
            let navigationController = segue.destination as! UINavigationController // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTableViewController.delegate = self // Set the delegate from AddItemTableViewController to itself (BucketListViewController)
        } else if sender is IndexPath {  // if sender is a IndexPath
            let navigationController = segue.destination as! UINavigationController // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTableViewController.delegate = self // Set the delegate from AddItemTableViewController to itself (BucketListViewController)
            let indexPath = sender as! IndexPath
            let item = items[indexPath.row]
            addItemTableViewController.item = item
            addItemTableViewController.indexPath = indexPath
        }
    }
    
    func cancelButtonPressed(by controller: AddItemTableViewController) {
        dismiss(animated: true, completion: nil) // Dismisses the view controller that was presented modally by the view controller.
    }
    
    /*
        We are passing around 3 parameters during the DELEGATION phase  ->  AddItemTableViewController, text, and indexPath.
     
        AddItemTableViewController is the UITableViewController class that is getting passed around.
        The text is a String and is getting passed around during the DELEGATION phase.
        The text is coming from the TextField. This texts gets passed around when the user clicks "Save".
        
        Why do we need to pass the IndexPath?
            The reason is because we want to update the index of the array when the user clicks on the table row cell
     
        We should only append items to an array when user clicks on the "+" button
     
        What is an IndexPath?
            indexPath is the selected row from the table view
     
        Now we see that the IndexPath is an Optional because it has this symbol "?"
        Why is IndexPath an Optional?
            IndexPath is an optional because the user may or may not click on the table row cell.
            So we don't know if a indexPath will exist or will not exist
    */
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: IndexPath?) {
        if let ip = indexPath { // if indexPath exists
            items[ip.row] = text // update the existing item
        } else { // indexPath does not exist
            items.append(text) // append item to array
        }
        tableView.reloadData() // reloads data for table view
        dismiss(animated: true, completion: nil)  // Dismisses the view controller that was presented modally by the view controller.
    }
    

}
