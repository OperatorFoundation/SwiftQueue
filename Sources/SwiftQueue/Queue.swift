//
//  Queue.swift
//  PacketTunnelExample
//
//  Created by Adelita Schule on 5/14/18.
//  Courtesy of https://www.raywenderlich.com/148141/swift-algorithm-club-swift-queue-data-structure

import Foundation

public class Queue<T>
{
    fileprivate var list = LinkedList<T>()
    public var isEmpty: Bool { return list.isEmpty }
    
    public func enqueue(_ element: T)
    {
        list.append(value: element)
    }
    
    public func dequeue() -> T?
    {
        guard !list.isEmpty, let element = list.first
        else
        {
            return nil
        }
        
        let poppedValue = list.pop(node: element)
        return poppedValue
    }
    
    public func peek() -> T?
    {
        return list.first?.value
    }
}

extension Queue: CustomStringConvertible
{
    public var description: String
    {
        return list.description
    }
}


