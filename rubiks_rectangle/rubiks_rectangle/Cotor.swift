//
//  Cotor.swift
//  rubiks_rectangle
//
//  Created by Zoey on 21/03/2016.
//  Copyright © 2016 Zoey. All rights reserved.
//

import Foundation
//: Playground - noun: a place where people can play

import UIKit

class cotor {
    
    struct que
    {
        var len:Int = 0
        var ch:String = "s"
        var pre:Int = 0
        var s:[Int] = [0,0,0,0,0,0,0,0]
    }
    
    var q = [que]()
    
    var hash = [Bool](repeating: false, count: 50000)
    
    var fac = [1,1,2,6,24,120,720,5040]
    
    var goal = [1,2,3,4,5,6,7,8] ////////////
    
    func check(_ x:[Int]) -> Bool
    {
        for i in 0...7
        {
            if x[i] != goal[i]
            {
                return false
            }
        }
        return true
    }
    
    func cotor(_ qq:que) ->Int
    {
        var sum = 0
        for i in 0 ..< 8
        {
            var t = 0
            for j in i+1 ..< 8
            {
                if qq.s[j] < qq.s[i]
                {
                    t = t + 1
                }
            }
            sum = sum + t * fac[7-i]
        }
        return (sum + 1)
    }
    
    func print1(_ k:Int) ->String
    {
        var k = k
        print(q[k].s)
        var i = 0
        var s:String = ""
        while q[k].len != 0
        {
            s = q[k].ch + s
            i = i+1
            k = q[k].pre
        }
        print(s)
        return s
        
    }
    
    func BFS() ->String
    {
        var temp = que()
        
        hash[cotor(q[0])] = true
        var head = 0
        var tail = 1
        q[0].len = 0
        var t = 0
        
        while head < tail
        {
            //  RE
            temp = q[head]
            temp.s = Array(temp.s.reversed())
            t = cotor(temp)
            if hash[t] == false
            {
                q[tail] = temp
                q[tail].len = q[head].len + 1
                q[tail].ch = "A"
                q[tail].pre = head
                hash[t] = true
                if check(q[tail].s)
                {
                    print("i found it")
                    break
                }
                tail = tail + 1
            }
            
            //  RCS
            temp = q[head]
            temp.s.insert(temp.s.remove(at: 3), at: 0)
            temp.s.insert(temp.s.remove(at: 4), at: 7)
            t = cotor(temp)
            if hash[t] == false
            {
                q[tail] = temp
                q[tail].len = q[head].len + 1
                q[tail].ch = "B"
                q[tail].pre = head
                hash[t] = true
                if check(q[tail].s)
                {
                    print("i found it")
                    break
                }
                tail = tail + 1
            }
            
            //  MCR
            temp = q[head]
            temp.s.insert(temp.s.remove(at: 6), at: 1)
            temp.s.insert(temp.s.remove(at: 3), at: 5)
            t = cotor(temp)
            if hash[t] == false
            {
                q[tail] = temp
                q[tail].len = q[head].len + 1
                q[tail].ch = "C"
                q[tail].pre = head
                hash[t] = true
                if check(q[tail].s)
                {
                    print("i found it")
                    break
                }
                tail = tail + 1
            }
            head = head + 1
        }
        return print1(tail)
    }
    
    func run(_ list:[Int]) ->String
    {
        goal = list
        //goal = [1,3,5,7,2,4,6,8] /////
        
        for _ in 0...50000
        {
            q.append(que())
        }
        
        q[0].s = [1,2,3,4,5,6,7,8]
        
        if check(q[0].s)
        {
            print("0")
            return "None"
        }
        else
        {
            return BFS()
        }
        
    }

}










