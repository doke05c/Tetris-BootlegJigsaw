# Tetris-BootlegJigsaw 
Group Name: "Tetris: Master and Noob"

Group Members: Afia Bidica, David Oke

Brief Project Description: 

This project's goal is to mimick Tetris as closely as possible. This is to be accomplished using a 2-dimensional area of space, with Pieces moving through the space. Pieces collide with one antoher, meaning it's impossible for a piece to move through another. If an entire row is horizontally consumed with pieces, it will "clear" by emptying the entire row and shifting every block above it down by the number of rows cleared. A new piece is summoned when all pieces currently on the board are stamped on to the board. Pieces have rotation states to allow clockwise and counterclockwise rotation.

Prototype Document: https://docs.google.com/document/d/1B44WfTRtLe2xEvWqtp4nwDef8D6y4Bqnm71EcUexJMU/edit?usp=sharing 

Compile/Run instructions:

This program runs in processing. Download the file, open it in processing, and click run. Use left/right arrow keys to shift pieces in those respective directions. Up arrow rotates the piece clockwise while the 'z' key rotates it counterclockwise, and the down arrow shifts the piece down. 'c' key adds a Piece to storage to be used at a later time. (Player can only put a piece in storage once per place cycle.) The spacebar stamps the piece on to the board and summons a new piece. Backspace resets the game, and the 'p' key pauses/unpauses the game.

Development Log:

5/22/22:

Today we started testing out branching and merging.

Afia: I made the Board.pde file.

David: I made the Piece.pde file.

5/23/22:

David: Added the instance variables and constructors for the Board class.

Afia: Added the accessor methods for the Board class.

5/24/22:

Afia: Created the instance variables for the Piece class. Created the piece constructor with all rotation states for each piece.

David: Made basic mutator methods for score, level, and lines cleared in Board class.

5/25/22:

Afia: Added x and y instance variables for piece, and added rotate accessor and rotation mutator methods in piece class. Altered the piece constructor so that rotation states are set into ArrayList Positions instead of added into it. Also added stamp method.

David: Made move() in Piece class which allows for Pieces to be moved. I also displayed the Board for the first time.

5/26/22:

Afia: Fixed syntax errors in rotate method. Consolidated the Board display instructions into one method.

David: Made Pieces display on Board, with downward, left, and right movement. Rotation also added but with incredibly buggy behavior. (my favorite: the Pieces would eat into the walls of the Board)

5/27/22:

Afia: Fixed the piece constructor, where multiple pieces had incorrect rotation states because I incremented incorrectly. 

David: When pieces are soft dropped, collision will no longer occur between them. Game will now reset if pieces are crammed at the top against a wall or the piece that is to spawn at the top middle.

5/28/22:

Afia: Added a checkPos method, which checks the positions of a rotation before rotating to make sure a certain rotation is possible. This method aims to prevent pieces from overlapping other pieces or rotating incorrectly in tight spaces.

David: Added the ability to check and clear lines that are full of squares. I also added lines cleared, score, and level to the game view and made them accurate to established mechanics.

5/29/22:

David: I modified move() so that only moves that are called when down key is pressed give points. This feature will make way for tick(), which will move() the Piece according to a set timer and not add points. Added a way to store a second Piece for gameplay convenience purposes.

5/30/22:

David: I made the demo branch!

5/31/22:

Afia: I introduced private ints in Tetris.pde to help pieces move down on their own at varying speeds throughout the game.

6/1/22:

Afia: David and I both worked on creating a tick() function that controls the speed at which pieces fall, instead of having the code float around in draw().

David: I helped consolidate a lot of the long-winded actions in Tetris.pde into their own void functions.

6/2/22:

Afia: I worked on the Loser screen. I created a boolean called Loser that tells you if you are a loser, and moved around a lot of code so that instead of auto-restarting when you lose, you are brought to the losing screen that tells you your stats for the game and prompts you to press backspace to restart the game. Also worked with David on pause because it was originally too fast to move pieces left/right when on top of other pieces and t-spins were basically impossible.

David: Afia and I both worked on the pause function, and giving players some room to move around the piece before it gets placed.
