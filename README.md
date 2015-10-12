
# facepad

Let's build a user news feed

## Instructions

### The Models

  * Make a `FISUser` feed with properties for the username, profile picture, and cover image
  * Make a `FISTextPost` object with properties for the user who posted and a property for the content itself.
  * Make a `FISImagePost` object with properties for the user and the content itself.

### The Views

  * Create an initial Table View Controller with a list of a bunch of usernames.
  * When you select a username it should push on a new Table View Controller you should get a view that looks something like this:
  ![](http://ironboard-curriculum-content.s3.amazonaws.com/iOS/facepad-image.png)
  * The top item is a cover image that when you scroll up, it should scroll up as well.
  * The second cell is a text content cell
  * the third cell is an image content cell

## Advanced

  * Check out how to do dynamic sized cell. [link](http://www.raywenderlich.com/73602/dynamic-table-view-cell-height-auto-layout) [Link](http://natashatherobot.com/ios-8-self-sizing-table-view-cells-with-dynamic-type/)
  * Those profile pic + username header looks like it should be a reusable component. Create a new `UIView` subclass that has those two things. You'll probably want to make a view with [a xib](http://qnoid.com/2013/03/20/How-to-implement-a-reusable-UIView.html).

