# OkCupid Clone

<!-- [Heroku link][heroku] -->

<!-- [heroku]: http:// MY URL WILL GO HERE  .herokuapp.com -->

## Minimum Viable Product
This site will be a clone of OkCupid built on Rails and using Backbone.

<!-- This is a Markdown checklist. Use it to keep track of your progress! -->

###MVP Proposal:
- [ ] **Create accounts**
- [ ] **Create sessions (log in)**
- [ ] **Edit profile**
  * [ ] *use "summary" text area*
  * [ ] *use "looking for" drop down*
  * [ ] *use "gender" drop down*
  * [ ] *use "birthday" calendar field*
  * [ ] *upload photo*
- [ ] **Answer questions**
- [ ] **See other users**
  * [ ] *See summary text*
  * [ ] *See question answers*
- [ ] **Search Users**
  * [ ] *by gender*
  * [ ] *by age*
  * [ ] *orientation*
  * [ ] *all three in combination*


## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User Authentication, Blog Creation (~1 day)
I will implement user authentication in Rails based on the practices learned at
App Academy. By the end of this phase, users will be able to create profiles using
a simple text form in a Rails view. The most important part of this phase will
be pushing the app to Heroku and ensuring that everything works before moving on
to phase 2.

[Details][phase-one]

### Phase 2: Answering Questions (~1 day)
I will implement a question answer form in Rails that displays a simple text
version of questions and there corresponding answer choices, and lets logged
in users create new QuestionAnswers. Also allows users to edit their existing
QuestionAnswers.

[Details][phase-two]

### Phase 3: Editing and User Profiles and Questions (~2 days)
I plan to use third-party libraries to add functionality to the `PostForm` and
`PostShow` views in this phase. First I'll need to add a Markdown editor to the
`PostForm`, and make sure that the Markdown is properly escaped and formatted in
the `PostShow` view. I also plan to integrate Filepicker for file upload so
users can add images to blog posts.

[Details][phase-three]

### Phase 4: User Feeds (~1-2 days)
I'll start by adding a `feed` route that uses the `current_user`'s
`subscribed_blogs` association to serve a list of blog posts ordered
chronologically. On the Backbone side, I'll make a `FeedShow` view whose `posts`
collection fetches from the new route.  Ultimately, this will be the page users
see after logging in.

[Details][phase-four]

### Phase 5: Searching for Blogs and Posts (~2 days)
I'll need to add `search` routes to both the Blogs and Posts controllers. On the
Backbone side, there will be a `SearchResults` composite view has `BlogsIndex`
and `PostsIndex` subviews. These views will use plain old `blogs` and `posts`
collections, but they will fetch from the new `search` routes.

[Details][phase-five]

### Bonus Features (TBD)
- [ ] Matching algorithm to compare user question answers
- [ ] Like feature for liking profiles
- [ ]

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md
