# AlrightEros

[Heroku link][heroku]

## TODOs for W8D7:
* [ ] make question answer loop:
  - [x] See question
  - [x] Make question index for now
  - [ ] When you click "submit", it verifies
  - [x] Answer gets stored in DB
  - [ ] If there are no errors, display the next question

* [x] Front end for profiles
  - [x] Make profile subview for index
  - [x] Improve profile show view

Stretch goals:
* [ ] add "acceptable answers" to question answers
  - [ ] figure out how best to store them
  - [ ] add them to answer form

* [ ] make matching algorithm work
  - [ ] *back end*: compare answers to each other
  - [ ] *front end*: display match percentages

## TODOs for W9D1:
* [ ] Resolve issues
  - [ ] Why does sign-in flash?
  - [ ] Why can't I navigate directly to #/profiles/:id ?
* [ ] Image upload

Stretch goals:
* [ ] Pagination
* [ ] Search
* [ ] Question answer loop

##General TODOs (most refactoring):
* Break profile overview (username, gender, age) into a partial

[heroku]: http://alrighteros.herokuapp.com

## Minimum Viable Product
This site will be a clone of OkCupid built on Rails and using Backbone.

###MVP Proposal:
- [x] **Create accounts**
  * [x] *Models*
  * [x] *Controllers*
- [x] **Create sessions (log in)**
  * [x] *Models*
  * [x] *Controllers*
- [ ] **Edit profile**
  * [x] *use "summary" text area*
  * [ ] *use "looking for" drop down*
  * [ ] *use "gender" drop down*
  * [x] *use "birthday" calendar field*
  * [ ] *upload photo*
- [ ] **View profiles**
  * [ ] *nice looking show view*
  * [ ] *partials for index view*
- [ ] **Answer questions**
  * [x] *Ability to write own answers to questions*
  * [ ] *Ability to view other users' answers to questions*
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

### Phase 1: User Authentication (~1 day)
I will implement user authentication in Rails based on the practices learned at App Academy. By the end of this phase, users will be able to create accounts and log in using a simple text form in a Rails view. The most important part of this phase will be pushing the app to Heroku and ensuring that everything works before moving on to phase 2.

[Details][phase-one]

### Phase 2: Create and view profiles (~1 day)
I will implement a basic text interface for updating user profiles. Users will be prompted to create a profile upon creating their account. Users who have not created a profile will only be able to view the 'new profile' page after logging in until completing their profile. Create Backbone views for profiles.

[Details][phase-two]

### Phase 3: Answering Questions (~1 day)
I will implement a question answer form that displays a questions and their corresponding answer choices, and lets logged in users create new QuestionAnswers. Also allows users to edit their existing QuestionAnswers.

[Details][phase-three]

### Phase 4: Editing and User Profiles and Questions (~2 days)
I'll build all the connections for questions and profiles between Rails and Backbone. Users can view question answers and other users' profiles in a mostly single page JavaScript application.

[Details][phase-four]

### Phase 5: Searching for Users (~2 days)
I'll integrate a search function that allows users to search for other users by age, gender, and orientation.

[Details][phase-five]

### Phase 6: Uploading Images (~1 day)
I'll allow users to upload images. I don't know how to do that yet. I'll figure it out and implement it. I assume that there are libraries for that.

[Details][phase-six]

### Bonus Features (TBD)
- [ ] Matching algorithm to compare user question answers
- [ ] Like feature for liking profiles
- [ ] Facebook Login option
- [ ] User feed

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md
[phase-six]: ./docs/phases/phase6.md
