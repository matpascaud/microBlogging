//
//  PostDetailViewController.swift
//  MicroBloggingApp
//
//  Created by Matthieu Pascaud on 05/06/2019.
//  Copyright © 2019 Matthieu PASCAUD. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var postBodyLabel: UILabel!
    
    var post: Post!
    fileprivate var request: AnyObject?
    var comments =  [Comment]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func initUIPost() {
        self.postTitleLabel.text = post.title
        self.postBodyLabel.text = post.body
    }
    
    func fetchCommentsByPost(postId: Int16) {
        let query: String = "postId=\(postId)"
        let commentsResource = CommentsResource(query: query)
        let commentsRequest = ApiRequest(resource: commentsResource)
        request = commentsRequest
        commentsRequest.load { [weak self] (commentsList) in
            guard let listComments = commentsList else {
                return
            }
            self!.comments = listComments!
            DispatchQueue.main.async { self?.tableView.reloadData() }
        }
    }
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCellId", for: indexPath) as! PostTableViewCell
        let itemComment = comments[indexPath.row]

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
