# Tetris-BootlegJigsaw 
Group Name: "Tetris: Master and Noob"

Group Members: Afia Bidica, David Oke

Brief Project Description: 

This project's goal is to mimick Tetris as closely as possible. This is to be accomplished using a 2-dimensional area of space, with Pieces moving through the space. Pieces collide with one antoher, meaning it's impossible for a piece to move through another. If an entire row is horizontally consumed with pieces, it will "clear" by emptying the entire row and shifting every block above it down by the number of rows cleared. A new piece is summoned when all pieces currently on the board are stamped on to the board. Pieces have rotation states to allow clockwise and counterclockwise rotation.

Prototype Document: https://docs.google.com/document/d/1B44WfTRtLe2xEvWqtp4nwDef8D6y4Bqnm71EcUexJMU/edit?usp=sharing 

Compile/Run instructions:

This program runs in processing. Use left/right arrow keys to shift pieces in those respective directions. Up arrow rotates the piece, and the down arrow shifts the piece down. The spacebar stamps the piece on to the board and summons a new piece. 

Development Log:

5/22/22:

Afia: Today we started testing out branching and merging. I made the Board.pde file.

David: 

5/23/22:

Afia: Added the accessor methods for the Board class.

David:

5/24/22:

Afia: Created the instance variables for the Piece class. Created the piece constructor with all rotation states for each piece.

David:

5/25/22:

Afia: Added x and y instance variables for piece, and added rotate accessor and rotation mutator method in piece class. Altered the piece constructor so that rotation states are set into ArrayList Positions instead of added. Also added stamp method.

David:

5/26/22:

Afia: Fixed syntax errors in rotate method. 

David:

5/27/22:

Afia: Fixed the piece constructor, where multiple pieces had incorrect rotation states because I incrimented incorrectly. 

David: 

5/28/22:

Afia: Added a checkPos method, which checks the positions of a rotation before rotating to make sure a certain rotation is possible. This method aims to prevent pieces from overlapping other pieces or rotate incorrectly in tight spaces.

David: 
