//
//  UsersAPIimpl.swift
//  VIPHub
//
//  Created by Eleanor on 21.08.24.
//

import Foundation

final class UsersAPIimpl : UsersAPI  {
    
//    static var isFetching: Bool = false
    let API_URL = "https://api.github.com/search/users?q="
    let API_TOKEN = "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"
    let cache = UsersCache()
    var state: GlobalState?
    var query: String
    var totalCount: Int
    var page: Int
    var hasNextPage: Bool
    var pageKey: String
    var shouldFetchAfterCaching: Bool
    
    init() {
        self.query = ""
        self.totalCount = 0
        self.page = 1
        self.hasNextPage = true
        self.pageKey = ""
        self.shouldFetchAfterCaching = true
    }
    
    func fetchUsers(input: String) async throws -> [User]{
        
        var users: [User] = []
        
        await state?.setIsFetchingFun(input: true)
        
        if (query != input) {
            query = input
            if let lastPage = cache.getLastPage(forKey: input) {
                page = lastPage
                shouldFetchAfterCaching = false
            }
            else {
                page = 1
                shouldFetchAfterCaching = true
            }
            totalCount = 0
            users = []
        }
        
        pageKey = input + String(page)
        print(pageKey)
        
        if let cachee = cache.getArray(forKey: input){
                print("Getting cached data")
                users = cachee
        }
        
        
        if (input == "") {
            await state?.setIsFetchingFun(input: false)
            return []
        }
        if (users.count == totalCount && totalCount>0) {
            await state?.setIsFetchingFun(input: false)
            hasNextPage = false
            return users
        }
    
        if (shouldFetchAfterCaching) {
            print("Making an API call for users!")
            
            let url = URL(string: "\(API_URL + query)&page=\(page)")!
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
           // request.setValue("Bearer \(API_TOKEN)", forHTTPHeaderField: "Authorization")
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoded = try JSONDecoder().decode(GHUserResponse.self, from: data)
            totalCount = decoded.total_count
            for decode in decoded.items {
                users.append(decode)
            }
            cache.setArray(users, forKey: input)
            page+=1
            cache.setLastPage(lastPage: page as NSNumber, forKey: input)
            await state?.setIsFetchingFun(input: false)
            hasNextPage = true
            return users
        }
    
        else {
            shouldFetchAfterCaching = true
            await state?.setIsFetchingFun(input: false)
            return users
        }
    }
    
}
