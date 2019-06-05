//
//  AuthorTableViewController.swift
//  MicroBloggingApp
//
//  Created by Matthieu PASCAUD on 5/26/19.
//  Copyright © 2019 Matthieu PASCAUD. All rights reserved.
//

import UIKit

class AuthorTableViewController: UITableViewController {
    
    fileprivate var request: AnyObject?
    var authors =  [Author]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        fetchAuthors()
    }
    
    func fetchAuthors() {
        let authorsResource = AuthorsResource()
        let authorsRequest = ApiRequest(resource: authorsResource)
        request = authorsRequest
        authorsRequest.load { [weak self] (authorsList) in
            guard let listAuth = authorsList else {
                return
            }
            self!.authors = listAuth!
            DispatchQueue.main.async { self?.tableView.reloadData() }
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return authors.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showAuthorDetails", sender: authors[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "authorViewCellId", for: indexPath) as! AuthorTableViewCell
        let itemAuthor = authors[indexPath.row]
        cell.nameLabel?.text = itemAuthor.name
        cell.emailLabel?.text = itemAuthor.email
        cell.avatarImageView.downloadImageFrom(link: itemAuthor.avatarUrl!, contentMode: UIView.ContentMode.scaleAspectFit)
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showAuthorDetails" {
            let destVC = segue.destination as! AuthorDetailViewController
            destVC.author = sender as? Author
        }
    }


}
