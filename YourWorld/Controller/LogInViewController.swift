//
//  LogInViewController.swift
//  YourWorld
//
//  Created by Joey Rattana on 3/14/18.
//  Copyright © 2018 Joey Rattana. All rights reserved.
//

import Foundation
import UIKit
import Apollo

let graphlQLEndpointURL = "http://localhost:4000"
let apollo = ApolloClient(url: URL(string: graphlQLEndpointURL)!)

class LogInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchPosts()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var posts: PostsQuery.Data.Feed? {
        didSet {
            print("update view here")
        }
    }
    
    func fetchPosts() {
        let postsQuery = PostsQuery()
        apollo.fetch(query: postsQuery) { result, error in
            if let error = error {
                print(#function, "ERROR | An error occured: \(error)")
                return
            }
            guard let posts = result?.data?.feed.posts else {
                print(#function, "ERROR | Could not retrieve posts")
                return
            }
            
            for post in posts {
                print(post.title)
            }
        }
    }
    
}
