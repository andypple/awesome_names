### Objective

Implement a web app that displays a list of baby names that a user submits. This can be just an
extremely simple text input with a submit button (with a growing list of names below it) on one
page.

### Core Requirements

- [x] Upon first visit, Users should default to working on a new distinct list.
- [x] A user’s list should have an ID (alphanumeric 12-character string) that uniquely identifies
it.
- [x] Users can return to a list by visiting a URL that includes a `list_id` parameter
- [x] Returning users that do not provide a list_id parameter are shown the list they most
recently viewed.
- [x] Users should be able to add as many names as they would like.
- [x] Whitespace should be trimmed from both ends of the submitted names.
- [x] Duplicate names (case-insensitive, per-list) should be prevented and result in
appropriate error messaging to the user.
- [x] Use PostgreSQL for your database engine

### Stretch Goals (completely optional)
- [x] Use React+Redux for the UI
- Clicking on a name crosses it out (and clicking again un-crosses it out). This crossed-out
state should persist across sessions and between users viewing the same list.
- [x] Only allow names with letters and (at most) one space.

  ○ Good: ‘Sally Lou’, ’Stanley’, ‘JoeBob Pringles’

  ○ Bad: ‘C3P0’, ’Stan the Man’
- Real-time updates when multiple people are working on the same list
- Client-side sorting of names (Alphabetical, By Input Time, By Length)
- Allow the user to manually prioritize the list using drag-and-drop functionality

### Video demo
- https://www.loom.com/share/7f808c83b17147af8545f857939e04c7

- Heroku link: https://awesome-names.herokuapp.com/

### Run local development note

- Please change API_HOST to `http://localhost:3000/api/`. Thanks
