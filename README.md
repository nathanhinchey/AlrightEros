# OkEris
[OkEris](http://www.okeris.com) is a matchmaking app for supervillains. It was originally created for App Academy in 2015, and hasn't really been updated since then.

## Local Setup Instructions

* Clone this repo
* In the root directory of the repo, run `bundle install`
* Set up the database: `rake db:setup`
* Run the migrations: `rake db:migrate`
* Seed the database: `rake db:seed`

## Functionality Summary
Here's what the app is supposed to do:

### Similarity Algorithm
The similarity algorithm uses a custom SQL query to compare the answers the current user has given to the answers other users have given. It checks all users, then sorts them in order by similarity. Since the database is thoroughly normalized, this invovles a large number of joins, as well as multiple self joins and two subqueries to select the desired columns and rows. In order to display profiles in a useful order, a custom pagination function that operates in 0(n) time organizes which profiles to display, only querying the database for those that it needs.

### Image Uploading
The app allows users to upload their own images to an Amazon Web Services S3 bucket. These images are managed by the [Paperclip](https://github.com/thoughtbot/paperclip) gem.

### Questions
Users can answer questions and create their own questions. At present, about 90% of questions on the site are user generated. When one user views another user's profile, they can only see answers to those questions which they have also answered. However they can also see the questions they have not answered, and if they click on it, a modal view for answering that question appears; upon answering, they can view the other user's answer as as well.

### Styling
All of the site is styled with CSS. A custom jQuery operation is used to scale images based on their dimensions. The site is specifically designed to be easily legible to people with colorblindness, and all fields have proper labels for use with screen readers. The font sizes are large and clear, with an eye to accessibility.


## Next Steps
- Strongly couple profile and account creation
- Like feature for liking profiles
- OAuth signup option
- User feed
- Use "looking for" drop downs
- Update calendar field to drop downs
- Email notifications
- Use websockets to have live message updates
- Further optimize SQL queries
