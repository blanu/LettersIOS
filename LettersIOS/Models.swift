//
//  Board.swift
//  LettersIOS
//
//  Created by BrandonWiley on 6/3/14.
//  Copyright (c) 2014 Operator. All rights reserved.
//

import Foundation

class Board
{
    let name: String
    var threads: Post[] = []
    
    init(name:String, threads:Post[])
    {
        self.name=name
        self.threads=threads
    }
}

class Post
{
    let postid: Int
    let title: String
    let body: String
    var replies: Post[] = []
    
    init(postid:Int, title:String, body:String, replies:Post[])
    {
        self.postid=postid
        self.title=title
        self.body=body
        self.replies=replies
    }
}