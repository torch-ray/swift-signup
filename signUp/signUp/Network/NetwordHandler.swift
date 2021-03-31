import Foundation

class NetworkHandler {
    
    static private var idData = [String]()
    
    static func getData(completion: @escaping ([String]) -> Void) {
            // 세션 생성, 환경설정
            let defaultSession = URLSession(configuration: .default)

            guard let url = URL(string: "https://8r6ruzgzve.execute-api.ap-northeast-2.amazonaws.com/default/SwiftCamp") else {
                print("URL is nil")
                return
            }
        let request = URLRequest(url: url)
        
        let dataTask = defaultSession.dataTask(with: request) {(data: Data?, response: URLResponse?, error: Error?) in
            guard error == nil else { return }
            
            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return
            }
            
            let result = String(data: data, encoding: .utf8) ?? ""
            
            idData = result.components(separatedBy: [",", "[", "\"", " ", "]"]).filter{$0.count > 0}
            completion(idData)
        }
        dataTask.resume()
    }
}
