# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


Post.create(title: 'Blog App', body: 'Application with using SQLite, AngularJS & Bootstrap')
Post.create(title: 'Rails or PHP', body: 'What would you choose - Rails 4.2 or PHP 5.4 ?')
Post.create(title: 'Full Stack Dev', body: 'How quickly you can become developers over all web-stack?

The barrier of entering the web development industry as a web developer is still low, but it’s getting increasingly complex.

The dynamic nature of the whole industry makes requirements shift often to the most popular and “next best thing” tools and programming languages.

Gone are the days when only one programming language or a very specific process was required from a developer. Nowadays programmers must know a range of technologies across multiple platforms in order to do good work.
What does a full-stack developer mean?

The term full-stack means developers who are comfortable working with both back-end and front-end technologies.

To be more specific, it means that the developer can work with databases, PHP, HTML, CSS, JavaScript and everything in between, also, venturing as far as converting Photoshop designs to front-end code.

A full-stack developer doesn’t need to master all of the areas and technologies he needs to work it, because that just makes it nearly impossible, he just needs to be comfortable working with those technologies, and that’s a lot too.
What full-stack meant in 2000 and what it means now?')
Post.create(title: 'New post', body: 'This is a new fancy post!')
Post.create(title: 'The post number 5', body: 'BODY')

Comment.create(post_id: 1, body: 'Hello, people!')
Comment.create(post_id: 2, body: 'The First comment for post #2')
Comment.create(post_id: 2, body: 'This is second comment for post #2')
Comment.create(post_id: 2, body: 'Rails is better! Yeah!')
Comment.create(post_id: 2, body: 'This is the comment for Post #2 after adding logic for automatic choosing post_id !!! =))')
Comment.create(post_id: 2, body: 'New comment')
Comment.create(post_id: 3, body: 'Comment for post #3')
Comment.create(post_id: 4, body: 'Comment for post #4')
Comment.create(post_id: 5, body: 'Comment for post #5')
