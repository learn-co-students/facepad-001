
# Facepad

## Objectives

1. Build dynamic custom table view cells.
2. Represent multiple types of object in the same table view.

## Instructions

Our app is going to be a simple two-page user feed browser. The first screen will be a table view with a list of usernames. Tapping on a username in that table view will push a user detail screen, with posts from the user that was tapped.

Let's start by making our model classes, since those are pretty straightforward.

### The Models

* Make a `FISUser` object with properties for username, profile picture, and cover image. Also give it an array of posts.
* We have two types of posts: text and image. Let's make a small class hierarchy for them:
    * `FISFeedPost` will be the base class for the other two classes. It has the properties all posts have in common: the user who posted, and the date it was posted.
    * `FISTextPost` should be a subclass of `FISFeedPost` that adds a string property for the text that the user posted.
    * `FISImagePost` should be a subclass of `FISFeedPost` with a `UIImage` property for the image the user posted.


Now let's make our storyboard.

### The Views

* Create an initial table view controller that will present a list of users. Embed this in a navigation controller.
* When you select a username, it should segue to another table view controller, the one for a individual user's feed.
* Set up the prototype cells for the user feed page. There will be three: a header (for the user's cover image), one for text posts, and one for image posts. For now, just pick a fixed height for the cells. They should look roughly like this:

![](http://ironboard-curriculum-content.s3.amazonaws.com/iOS/facepad-image.png)

### The Code

Alright! Let's tie it all together.

* Make the `UITableViewController` subclass for the initial view controller (the one that displays the lists of users). In its `-viewDidLoad`, make some dummy users and posts, and use that to power the table view. (For now, just add images to your app. Open the `Images.xcassets` file in Xcode and drag in some images. You can load them in code with `+[UIImage imageNamed:]`.)
* Make the `UITableViewController` subclass for the user feed controller. Think about how best to pass the data (i.e., the user to display) from the first view controller on to the second.
* Make `UITableviewCell` subclasses for each of the prototype cells, and wire up outlets so you access the views inside them.
    * In your user feed view controller's `-tableView:cellForRowAtIndexPath:`, you'll need to inspect the cell you're being asked to display, pick the corresponding reuse identifier, and cast the cell from `-dequeueReusableCellWithIdentifier:forIndexPath:` to the correct class so you can set it up appropriately.

## Advanced

* Those profile pic + username headers look like they could be a reusable component. Create a new `UIView` subclass that has those two things. You'll probably want to make a view with [a XIB](http://qnoid.com/2013/03/20/How-to-implement-a-reusable-UIView.html).
* Create a custom cell for the first view controller that displays not only the user's name, but also their photo and the number of posts they have made.


<p data-visibility='hidden'>View <a href='https://learn.co/lessons/facepad' title='Facepad'>Facepad</a> on Learn.co and start learning to code for free.</p>
