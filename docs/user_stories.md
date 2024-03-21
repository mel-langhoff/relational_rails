[X] done

User Story 1, artist Index 

For each artist table
As a visitor
When I visit '/artists'
Then I see the name of each artist record in the system

[X] done

User Story 2, artist Show 

As a visitor
When I visit '/artists/:id'
Then I see the artist with that id including the artist's attributes
(data from each column that is on the artist table)

[X] done

User Story 3, album Index 

As a visitor
When I visit '/albums'
Then I see each album in the system including the album's attributes
(data from each column that is on the album table)

[X] done

User Story 4, album Show 

As a visitor
When I visit '/albums/:id'
Then I see the album with that id including the album's attributes
(data from each column that is on the album table)

[X] done

User Story 5, artist album Index 

As a visitor
When I visit '/artists/:artist_id/albums'
Then I see each album that is associated with that artist with each album's attributes
(data from each column that is on the album table)

ActiveRecord

[X] done

User Story 6, artist Index sorted by Most Recently Created 

As a visitor
When I visit the artist index,
I see that records are ordered by most recently created first
And next to each of the records I see when it was created

[X] done

User Story 7, artist album Count

As a visitor
When I visit a artist's show page
I see a count of the number of albums associated with this artist

Usability

[X] done

User Story 8, album Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the album Index

[X] done

User Story 9, artist Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the artist Index

[ ] done

User Story 10, artist album Index Link

As a visitor
When I visit a artist show page ('/artists/:id')
Then I see a link to take me to that artist's `album` page ('/artists/:id/albums')

Iteration 2

CRUD

[ ] done

User Story 11, artist Creation 

As a visitor
When I visit the artist Index page
Then I see a link to create a new artist record, "New artist"
When I click this link
Then I am taken to '/artists/new' where I  see a form for a new artist record
When I fill out the form with a new artist's attributes:
And I click the button "Create Artist" to submit the form
Then a `POST` request is sent to the '/artists' route,
a new artist record is created,
and I am redirected to the artist Index page where I see the new artist displayed.
[ ] done

User Story 12, artist Update 

As a visitor
When I visit a artist show page
Then I see a link to update the artist "Update artist"
When I click the link "Update artist"
Then I am taken to '/artists/:id/edit' where I  see a form to edit the artist's attributes:
When I fill out the form with updated information
And I click the button to submit the form
Then a `PATCH` request is sent to '/artists/:id',
the artist's info is updated,
and I am redirected to the artist's Show page where I see the artist's updated info
[ ] done

User Story 13, artist album Creation 

As a visitor
When I visit a artist albumren Index page
Then I see a link to add a new adoptable album for that artist "Create album"
When I click the link
I am taken to '/artists/:artist_id/album/new' where I see a form to add a new adoptable album
When I fill in the form with the album's attributes:
And I click the button "Create album"
Then a `POST` request is sent to '/artists/:artist_id/album',
a new album object/row is created for that artist,
and I am redirected to the artist albums Index page where I can see the new album listed
[ ] done

User Story 14, album Update 

As a visitor
When I visit a album Show page
Then I see a link to update that album "Update album"
When I click the link
I am taken to '/album/:id/edit' where I see a form to edit the album's attributes:
When I click the button to submit the form "Update album"
Then a `PATCH` request is sent to '/album/:id',
the album's data is updated,
and I am redirected to the album Show page where I see the album's updated information
ActiveRecord
[ ] done

User Story 15, album Index only shows `true` Records 

As a visitor
When I visit the album index
Then I only see records where the boolean column is `true`
[ ] done

User Story 16, Sort artist's albumren in Alphabetical Order by name 

As a visitor
When I visit the artist's albumren Index Page
Then I see a link to sort albumren in alphabetical order
When I click on the link
I'm taken back to the artist's albumren Index Page where I see all of the artist's albumren in alphabetical order
Usability
[ ] done

User Story 17, artist Update From artist Index Page 

As a visitor
When I visit the artist index page
Next to every artist, I see a link to edit that artist's info
When I click the link
I should be taken to that artist's edit page where I can update its information just like in User Story 12
[ ] done

User Story 18, album Update From albums Index Page 

As a visitor
When I visit the `album` index page or a artist `album` index page
Next to every album, I see a link to edit that album's info
When I click the link
I should be taken to that `album` edit page where I can update its information just like in User Story 14
Iteration 3
CRUD
[ ] done

User Story 19, artist Delete 

As a visitor
When I visit a artist show page
Then I see a link to delete the artist
When I click the link "Delete artist"
Then a 'DELETE' request is sent to '/artists/:id',
the artist is deleted, and all album records are deleted
and I am redirected to the artist index page where I no longer see this artist
[ ] done

User Story 20, album Delete 

As a visitor
When I visit a album show page
Then I see a link to delete the album "Delete album"
When I click the link
Then a 'DELETE' request is sent to '/album/:id',
the album is deleted,
and I am redirected to the album index page where I no longer see this album
ActiveRecord
[ ] done

User Story 21, Display Records Over a Given Threshold 

As a visitor
When I visit the artist's albumren Index Page
I see a form that allows me to input a number value
When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
Then I am brought back to the current index page with only the records that meet that threshold shown.
Usability
[ ] done

User Story 22, artist Delete From artist Index Page 

As a visitor
When I visit the artist index page
Next to every artist, I see a link to delete that artist
When I click the link
I am returned to the artist Index Page where I no longer see that artist
[ ] done

User Story 23, album Delete From albums Index Page 

As a visitor
When I visit the `album` index page or a artist `album` index page
Next to every album, I see a link to delete that album
When I click the link
I should be taken to the `album` index page where I no longer see that album
Extensions
[ ] done

Extension 1: Sort artists by Number of albumren 

As a visitor
When I visit the artists Index Page
Then I see a link to sort artists by the number of `album` they have
When I click on the link
I'm taken back to the artist Index Page where I see all of the artists in order of their count of `album` (highest to lowest) And, I see the number of albumren next to each artist name
[ ] done

Extension 2: Search by name (exact match)

As a visitor
When I visit an index page ('/artists') or ('/album')
Then I see a text box to filter results by keyword
When I type in a keyword that is an exact match of one or more of my records and press the Search button
Then I only see records that are an exact match returned on the page
[ ] done

Extension 3: Search by name (partial match)

As a visitor
When I visit an index page ('/artists') or ('/album')
Then I see a text box to filter results by keyword
When I type in a keyword that is an partial match of one or more of my records and press the Search button
Then I only see records that are an partial match returned on the page

This functionality should be separate from your exact match functionality.