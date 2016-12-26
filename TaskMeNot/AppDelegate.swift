//
//  AppDelegate.swift
//  TaskMeNot
//
//  Created by Rohit Nisal on 12/23/16.
//  Copyright © 2016 Rohit Nisal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        showLoginScreen();
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func snapView() -> UIView {
         let snapshot:UIView = (self.window?.snapshotView(afterScreenUpdates: true))!
        return snapshot;
    }
    
    func showTaskBarController(){
        let storyBoard  = UIStoryboard(name: "Main", bundle: nil)
        let taskTabBarController = storyBoard.instantiateViewController(withIdentifier: "taskTabBarController")

        let snapshot:UIView = snapView()
        taskTabBarController.view.addSubview(snapshot);
        
        self.window?.rootViewController = taskTabBarController

        UIView.animate(withDuration: 0.8, animations: {() in
            snapshot.layer.opacity = 0;
            snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5);
        }, completion: {
            (value: Bool) in
            snapshot.removeFromSuperview();
        });
        
    }
    
    func showLoginScreen(){
        let storyBoard  = UIStoryboard(name: "Main", bundle: nil)
        let loginNavViewController = storyBoard.instantiateViewController(withIdentifier: "loginNavController")
        let snapshot:UIView = snapView()
        loginNavViewController.view.addSubview(snapshot);
        self.window?.rootViewController = loginNavViewController
        
        UIView.animate(withDuration: 0.8, animations: {() in
            snapshot.layer.opacity = 0;
            snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5);
        }, completion: {
            (value: Bool) in
            snapshot.removeFromSuperview();
        });

    }

}

