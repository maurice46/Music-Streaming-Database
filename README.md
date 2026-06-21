In this project I designed and built a relational database for a simplified music streaming 
service. Development lifecycle: requirements analysis, conceptual design (ER diagram), logical 
design (relational schema), physical implementation in MySQL, and a programming layer using 
views, stored procedures, and triggers. 

The main entities I used were User, Artist, Album, Playlist, Genre, and StreamingEvent. 
Each of the entities were represented instead of attributes because they each contain their 
own properties and relationships. For example, User has its own attributes username, 
email, subscription tier, etc, and User is used for creating playlists, liking songs and 
following other users or artists. Artist can be associated with different albums and songs, 
Playlist is an entity because it's a collection created by a user, Genre is an entity because it 
contains multiple songs and artists, and StreamingEvent is an entity because it contains 
user interactions with songs.  

For the many-to-many relationships, I did a lot of associative entities. For example, the 
relationship between User and Song for liked songs is seen through the Liked_Song entity. 
The relationship between Playlist and Song is seen through Playlist_Song, which describes 
how a song is included in a playlist. The User_Follows_User and User_Follows_Artist 
entities are used to connect the User and Artist entities to see who follows who. Song and 
Genre and Artist and Genre do similar things, which allows multiple genres per song or 
artist. The Album_Featured_Artist is used to represent the relationship between albums 
and artists, so multiple artists can be on one album.  

The User and Artist entities were handled as a relationship. Specifically, a one-to-one 
relationship because not all users are artists and not all artists are users. 
The ordering of songs within a playlist was modeled using the Playlist_Song entity with the 
order_played attribute. The order_played stores the position to ensure that each song has 
a specific placement in the playlist, and it is easy to access and reorder them. 

The weak entities I identified include Playlist_Song, Liked_Song, User_Follows_User, 
User_Follows_Artist, Song_Genre, Artist_Genre, and Album_Featured_Artist. They are 
considered weak because they depend on the other entities for them to be useful. Also, 
they all contain the primary keys of the main entities. For example, Playlist_Song cannot 
exist without both Playlist and Song. All the others are similar. 
