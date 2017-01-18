# URLockBox

<p> URLockbox is a small application for tossing various forms of inspiration for later review. It's not unlike Delicious or Pinboard. It is the spiritual successor of Ideabo.</p>

<p>The idea behind is to allow authenticated users to login, write down their titles and links, so it can be used in the future as a reference.</p>

### Section 1 - Sign Up, Sign In, and Sign Out

1. #### Sign Up

    As an unauthenticated user, if I click "Sign Up", I should be taken to a user form where I can
    enter an **email address**, a **password**, and a **password confirmation**.

    - I cannot sign up with an email address that has already been used.
    - Password and confirmation must match.
    - If criteria is not met the user should be given a message to reflect the reason they could not sign up.

    Upon submitting this information, I should be logged in via a session cookie and redirected to the "Links Index" page.

1. #### Sign In

    As an registered user when I attempt to sign in, I receive a flash message reflect a successful, or unsuccessful log in attempt.

1. #### Sign Out

    As an authenticated user viewing the index page, I should see a link to "Sign Out" and not see a link to "Sign In". This should redirect me back to the page that prompts me to "Log In or Sign Up".

### Section 2 - Submitting links

1. #### Submitting Links  

  As an _authenticated user_ viewing the main page (`links#index`), I should see a simple form to submit a link.

  The `Link` model should include:

  1. A _valid_ URL location for the link.

  2. A _Title_ for the link.

  3. Additionally, all links have a `read` status that is either true or false. This status will default to `false` everytime a new record is created.

  4. Submitting an invalid link should result in an error message being displayed that indicated why the user was not able to add the link (I have used flash messages to handle this piece of the application).

2. ####  Viewing Links

  1. Once a link has been submitted, we should render the index page. 
  
  2. should display all of _my_ links __only__.
  
### Section 3 - Editing Links  

1. #### Edit posted link

  As an authenticated user who has added links to my URLockbox, when I view the links index:

  1.  Each link has an "Edit" button that either takes me to a page to edit the link.

  2.  I can edit the title and/or the url of the link.

  3.  I cannot change the url to an invalid url. Render error message in case this scenario takes place.
