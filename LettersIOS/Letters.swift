//
//  Letters.swift
//  LettersIOS
//
//  Created by BrandonWiley on 6/3/14.
//  Copyright (c) 2014 Operator. All rights reserved.
//

import Foundation

class Letters
{
    var client:PackRPC
    
    init()
    {
        let url:NSURL = NSURL(scheme: "http", host: "synapthein.org:8081", path: "/")
        client=PackRPC(serviceEndpoint:url)
    }
    
    func getBoardNames(callback:PackRPCCompletionHandler?) -> Void
    {
        client.callMethod("getBoardNames", onCompletion: callback)
    }
    
    func makeThread(board: String, title: String, body: String, callback:PackRPCCompletionHandler?) -> Void
    {
        client.callMethod("makeThread", withParameters: [board, [title,body]], onCompletion: callback)
    }
    
    func reply(board: String, title:String, body:String, parentID:Int, callback:PackRPCCompletionHandler) -> Void
    {
        client.callMethod("reply", withParameters: [board, [title, body], parentID], onCompletion: callback)
    }
    
    func getThreadIDs(board: String, callback:PackRPCCompletionHandler) -> Void
    {
        client.callMethod("getThreadIDs", withParameters: [board], onCompletion: callback)
    }
    
    func getPost(board: String, postid:Int, callback:PackRPCCompletionHandler) -> Void
    {
        client.callMethod("getPost", withParameters: [board, postid], onCompletion: callback)
    }
}
