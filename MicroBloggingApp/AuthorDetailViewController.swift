//
//  AuthorDetailViewController.swift
//  MicroBloggingApp
//
//  Created by Matthieu PASCAUD on 5/29/19.
//  Copyright © 2019 Matthieu PASCAUD. All rights reserved.
//

import UIKit

class AuthorDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var authorNamelabel: UILabel!
    @IBOutlet weak var authorUsernameLabel: UILabel!
    @IBOutlet weak var authorEmailLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var tableViewPosts: UITableView!
    
    var author: Author!
    let dateFormatter = DateFormatter()
    fileprivate var request: AnyObject?
    var posts =  [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale.current
        initUIAuthor()
        fetchPostByAuthor(authorId: author!.identifier)
    }
    
    func initUIAuthor() {
        self.authorNamelabel.text = author.name
        self.authorUsernameLabel.text = author.username
        self.authorEmailLabel.text = author.email
        //rounded avatar image view
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.size.width / 2
        self.avatarImageView.clipsToBounds = true
        self.avatarImageView.downloadImageFrom(link: author.avatarUrl!, contentMode: UIView.ContentMode.scaleAspectFit)
    }
    
    func fetchPostByAuthor(authorId: Int) {
        let query: String = "authorId=\(authorId)"
        let postsResource = PostsResource(query: query)
        let postsRequest = ApiRequest(resource: postsResource)
        request = postsRequest
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
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showCommentsSegue", sender: posts[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCellId", for: indexPath) as! PostTableViewCell
        let itemPost = posts[indexPath.row]
        cell.titleLabel.text = itemPost.title
        cell.bodyLabel.text = itemPost.body
        cell.dateLabel.text = dateFormatter.string(from: itemPost.date!)
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showCommentsSegue" {
            let destVC = segue.destination as! PostDetailViewController
            destVC.post = sender as? Post
        }
    }


}
