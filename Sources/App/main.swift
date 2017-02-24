import Vapor

let drop = Droplet()

drop.get("hello") { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.get("/name", ":name") { request in
    if let name = request.parameters["name"]?.string {
        return "Hello \(name)!"
    }
    return "Error on parameters"
}

//drop.get("hello") { request in
//    return "Hello, world!"
//}

drop.resource("posts", PostController())

drop.run()
