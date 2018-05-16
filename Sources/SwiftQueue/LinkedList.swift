//
//  LinkedList.swift
//  PacketTunnelExample
//
//  Created by Adelita Schule on 5/11/18.
//  Courtesy of https://www.raywenderlich.com/144083/swift-algorithm-club-swift-linked-list-data-structure

import Foundation

public class Node<T>
{
    var value: T
    var next: Node<T>?
    weak var previous: Node<T>?
    
    init(value: T)
    {
        self.value = value
    }
}

public class LinkedList<T>
{
    fileprivate var head: Node<T>?
    private var tail: Node<T>?
    
    public var isEmpty: Bool
    {
        return head == nil
    }
    
    public var first: Node<T>?
    {
        return head
    }
    
    public var last: Node<T>?
    {
        return tail
    }
    
    public func append(value: T)
    {
        let newNode = Node(value: value)
        
        if let tailNode = tail
        {
            newNode.previous = tailNode
            tailNode.next = newNode
        }
        else
        {
            head = newNode
        }
        
        tail = newNode
    }
    
    public func node(atIndex index: Int) -> Node<T>?
    {
        if index >= 0
        {
            var node = head
            var i = index
            while node != nil
            {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        
        return nil
    }
    
    public func removeAll()
    {
        head = nil
        tail = nil
    }
    
    public func pop(node: Node<T>) -> T
    {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev
        {
            // Update the next pointer if you are not removing the first node in the list.
            prev.next = next
        }
        else
        {
            // Update the head pointer if you are removing the first node in the list.
            head = next
        }
        
        // Update the previous pointer to the previous pointer of the deleted node.
        next?.previous = prev
        
        if next == nil
        {
            // Update the tail if you are removing the last node in the list.
            tail = prev
        }
        
        // Assign nil to the removed nodes previous and next pointers.
        node.previous = nil
        node.next = nil
        
        // Return the value for the removed node.
        return node.value
    }
    
    
}

extension LinkedList: CustomStringConvertible
{
    public var description: String
    {
        var text = "["
        var node = head
        while node != nil
        {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += "," }
        }
        return text + "]"
    }
}





