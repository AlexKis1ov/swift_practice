import UIKit

//: # Lesson 6
//: ## Классы

let postTitle = "Classes"
let postBody = "Text of the article"
let postAuthor = "Alexey Efimov"

let postTitle2 = "Properties of classes"
let postBody2 = "Text of the article"
let postAuthor2 = postAuthor

class Post {
    var title = ""
    var body = ""
    var author = ""
    var numberOfComments: Int {
        comments.count
    }
    
    private var comments: [String] = []
    
    func addComment(_ comment: String) {
        comments.append(comment)
    }
    
    func showAllComments() {
        for comment in comments {
            print(comment)
        }
    }
}

let firstPost = Post()

firstPost.title = "This is my first post"
firstPost.body = "Hello"
firstPost.author = "Alexey Efimov"
firstPost.addComment("Thank you so much")
firstPost.addComment("New comment")

//firstPost.comments = []
firstPost.showAllComments()
firstPost.numberOfComments

//let secondPost = firstPost
let secondPost = Post()

secondPost.title = "Second Post"
secondPost.body = "A lot of text"
secondPost.author

//print("Author \(firstPost.author) has published new post '\(firstPost.title)' with text '\(firstPost.body)'")
//print("Author \(secondPost.author) has published new post '\(secondPost.title)' with text '\(secondPost.body)'")

print("The number of comments for the post \(firstPost.title) is \(firstPost.numberOfComments)")
//print("The number of comments for the post \(secondPost.title) is \(secondPost.numberOfComments)")


firstPost === secondPost

//: ### Методы классов



//: ### Инициализация

class Human {
    let name: String
    var age = 0
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func walk() {
        print("I can walk")
    }
    
    func sleep() {
        print("I need sleep")
    }
    
    func eat() {
        print("A need food")
    }
}

let person = Human(name: "Tim Cook", age: 56)
let ron = Human(name: "Ron")
person.name
person.age

//: ### Наследовение

class Child: Human {
    
    func nursing() {
        if age <= 5 {
            print("I need care")
        } else {
            print("I can eat independently")
        }
    }
    
    func parenting() {
        if age >= 5 && age <= 13 {
            print("I need an education")
        } else if age < 5 {
            print("Me too early to educate")
        } else {
            print("Me too late to educate")
        }
    }
    
}

let littleBoy = Child(name: "Tom", age: 4)
littleBoy.walk()
littleBoy.nursing()
littleBoy.parenting()

class SchoolChild: Child {
    
    func schooling() {
        if age >= 6 && age <= 17 {
            print("I have to go to school")
        } else {
            print("I'm still too early in school")
        }
    }
}

let sarah = SchoolChild(name: "Sarah", age: 8)
sarah.schooling()

//: ### Полиморфизм

class Shape {
    func draw() {
        print("Draw some shape")
    }
}

class Rectangle: Shape {
    override func draw() {
        print("Draw Rectangle")
    }
}

class Triangle: Shape {
    override func draw() {
        print("Draw Triangle")
    }
}

class Circle: Shape {
    override func draw() {
        print("Draw Circle")
    }
}

/*
func drawRectangle(_ rectangle: Rectangle) {
    rectangle.draw()
}

func drawTriangle(_ triangle: Triangle) {
    triangle.draw()
}

func drawCircle(_ circle: Circle) {
    circle.draw()
}
*/

func drawShape(_ shape: Shape) {
    shape.draw()
}

let rectangle = Rectangle()
let triangle = Triangle()
let circle = Circle()

//drawRectangle(rectangle)
//drawTriangle(triangle)
//drawCircle(circle)

drawShape(rectangle)
drawShape(triangle)
drawShape(circle)
