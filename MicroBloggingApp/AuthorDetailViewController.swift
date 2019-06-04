//
//  AuthorDetailViewController.swift
//  MicroBloggingApp
//
//  Created by Matthieu PASCAUD on 5/29/19.
//  Copyright © 2019 Matthieu PASCAUD. All rights reserved.
//

import UIKit

class AuthorDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewPosts: UITableView!
    var posts =  [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPostByAuthor(authorId: 1)
        // Do any additional setup after loading the view.
    }
    
    func fetchPostByAuthor(authorId: Int16) {
        let query: String = "authorId?\(authorId)"
        let postsResource = PostsResource(query: query)
        let postsRequest = ApiRequest(resource: postsResource)
        postsRequest.load { [weak self] (postsList) in
            guard let listPosts = postsList else {
                return
            }
            self!.posts = listPosts!
            DispatchQueue.main.async { self?.tableViewPosts.reloadData() }
        }
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showPostDetails", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCellId", for: indexPath) as! PostTableViewCell
    
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
