//
//  ViewController.swift
//  GCDDemo
//
//  Created by Hunter Li on 2019/7/27.
//  Copyright © 2019 Dabing Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func syncConcurrentMainThread(_ sender: UIButton) {
        syncConcurrent()
    }
    
    @IBAction func syncConcurrentNewThread(_ sender: UIButton) {
        Thread.detachNewThread {
            self.syncConcurrent()
        }
    }
    
    @IBAction func asyncConcurrentMainThread(_ sender: UIButton) {
        asyncConcurrent()
    }
    
    @IBAction func asyncConcurrentNewThread(_ sender: UIButton) {
        Thread.detachNewThread {
            self.asyncConcurrent()
        }
    }
    
    @IBAction func syncSerialMainThread(_ sender: UIButton) {
        syncSerial()
    }
    
    @IBAction func syncSerialNewThread(_ sender: UIButton) {
        Thread.detachNewThread {
            self.syncSerial()
        }
    }
    
    @IBAction func asyncSerialMainThread(_ sender: UIButton) {
        asyncSerial()
    }
    
    @IBAction func asyncSerialNewThread(_ sender: UIButton) {
        Thread.detachNewThread {
            self.asyncSerial()
        }
    }
    
    @IBAction func syncMainQueueMainThread(_ sender: UIButton) {
        syncMainQueue()
    }
    
    @IBAction func syncMainQueueNewThread(_ sender: UIButton) {
        Thread.detachNewThread {
            self.syncMainQueue()
        }
    }
    
    @IBAction func asyncMainQueueMainThread(_ sender: UIButton) {
        asyncMainQueue()
    }
    
    @IBAction func asyncMainQueueNewThread(_ sender: UIButton) {
        Thread.detachNewThread {
            self.asyncMainQueue()
        }
    }
}

extension ViewController {
    func syncConcurrent() {
        print("current thread: \(Thread.current)")
        print("syncConcurrent --- begin")
        let queue = DispatchQueue(label: "com.demo.concurrent", attributes: .concurrent)
        queue.sync {
            for i in 0..<3 {
                Thread.sleep(forTimeInterval: 2)
                print("1===\(i), \(Thread.current)")
            }
        }
        
        queue.sync {
            for i in 0..<3 {
                Thread.sleep(forTimeInterval: 2)
                print("2===\(i), \(Thread.current)")
            }
        }
        
        queue.sync {
            for i in 0..<3 {
                Thread.sleep(forTimeInterval: 2)
                print("3===\(i), \(Thread.current)")
            }
        }
        
        print("syncConcurrent --- end")
    }
}
extension ViewController {
    func asyncConcurrent() {
        print("current thread: \(Thread.current)")
        print("asyncConcurrent --- begin")
        //let queue = DispatchQueue(label: "com.demo.concurrent", attributes: .concurrent)
        let queue = DispatchQueue.global()
        queue.async {
            for i in 0..<3 {
                Thread.sleep(forTimeInterval: 2)
                print("1===\(i), \(Thread.current)")
            }
        }
        
        queue.async {
            for i in 0..<3 {
                Thread.sleep(forTimeInterval: 2)
                print("2===\(i), \(Thread.current)")
            }
        }
        
        queue.async {
            for i in 0..<3 {
                Thread.sleep(forTimeInterval: 2)
                print("3===\(i), \(Thread.current)")
            }
        }
        
        print("asyncConcurrent --- end")
    }
}

extension ViewController {
    func syncSerial() {
        print("current thread: \(Thread.current)")
        print("syncSerial --- begin")
        let queue = DispatchQueue(label: "com.demo.serial")
        queue.sync {
            for i in 0..<3 {
                Thread.sleep(forTimeInterval: 2)
                print("1===\(i), \(Thread.current)")
            }
        }
        
        queue.sync {
            for i in 0..<3 {
                Thread.sleep(forTimeInterval: 2)
                print("2===\(i), \(Thread.current)")
            }
        }
        
        queue.sync {
            for i in 0..<3 {
                Thread.sleep(forTimeInterval: 2)
                print("3===\(i), \(Thread.current)")
            }
        }
        
        print("syncSerial --- end")
    }
}
extension ViewController {
    func asyncSerial() {
        print("current thread: \(Thread.current)")
        print("asyncSerial --- begin")
        let queue = DispatchQueue(label: "com.demo.serial")
        queue.async {
            for i in 0..<3 {
                Thread.sleep(forTimeInterval: 2)
                print("1===\(i), \(Thread.current)")
            }
        }
        
        queue.async {
            for i in 0..<3 {
                Thread.sleep(forTimeInterval: 2)
                print("2===\(i), \(Thread.current)")
            }
        }
        
        queue.async {
            for i in 0..<3 {
                Thread.sleep(forTimeInterval: 2)
                print("3===\(i), \(Thread.current)")
            }
        }
        
        print("asyncSerial --- end")
    }
}

extension ViewController {
    func syncMainQueue() {
        print("current thread: \(Thread.current)")
        print("syncMainQueue --- begin")
        let queue = DispatchQueue.main
        queue.sync {
            for i in 0..<3 {
                Thread.sleep(forTimeInterval: 2)
                print("1===\(i), \(Thread.current)")
            }
        }
        
        queue.sync {
            for i in 0..<3 {
                Thread.sleep(forTimeInterval: 2)
                print("2===\(i), \(Thread.current)")
            }
        }
        
        queue.sync {
            for i in 0..<3 {
                Thread.sleep(forTimeInterval: 2)
                print("3===\(i), \(Thread.current)")
            }
        }
        
        print("syncMainQueue --- end")
    }
}
extension ViewController {
    func asyncMainQueue() {
        print("current thread: \(Thread.current)")
        print("asyncMainQueue --- begin")
        let queue = DispatchQueue.main
        queue.async {
            for i in 0..<3 {
                Thread.sleep(forTimeInterval: 2)
                print("1===\(i), \(Thread.current)")
            }
        }
        
        queue.async {
            for i in 0..<3 {
                Thread.sleep(forTimeInterval: 2)
                print("2===\(i), \(Thread.current)")
            }
        }
        
        queue.async {
            for i in 0..<3 {
                Thread.sleep(forTimeInterval: 2)
                print("3===\(i), \(Thread.current)")
            }
        }
        
        print("asyncMainQueue --- end")
    }
}
