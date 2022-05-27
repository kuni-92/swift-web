import Foundation
import FoundationNetworking

print("Start server!!!")

// create url session
print("Creating URL session...")
let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)

// making url
print("Making URL...")
let urlcomponents = URLComponents(string: "http://localhost:3030")
let url = urlcomponents?.url

let task = session.dataTask(with: url!) { data, response, error in
    print("Error check...")
    if let error = error {
        print(error.localizedDescription)
        return
    }

    print("Data check...")
    guard let data = data, let response = response as? HTTPURLResponse else {
        print("No data")
        return
    }

    print("Response check...")
    let responseContent = String(data: data, encoding: .utf8)!
    print(response.statusCode)
    print(responseContent)
}

print("Server run...")
task.resume()
