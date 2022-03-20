//
//  Model.swift
//  onedaybuild
//
//  Created by Tj on 3/12/22.
//  Copyright © 2022 Yusif Tijani. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos() {
        
        // Create a URL object
        let url = URL(string: Contants.API_URL)
        
        guard url != nil else {
            return
        }
        
        // Get a URLSession object
        
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            do {
                
                // Parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response  = try decoder.decode(Response.self, from: data!)
                
                dump(response)  
            }
            catch {
                
            }
            
        }
        
        // Kick off the task
        dataTask.resume()
    }
    
}
