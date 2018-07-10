# EmbeddedView

Load any subclass of EmbeddedView into a corresponding .xib container view while keeping its constraints.

Importing

Clone repo and build
Copy framework into your target project.
In the Copy Files build phase add EmbeddedView.framework to the Frameworks Destination

The Problem

1. Assume a custom view is created in a .xib and it has a corresponding class implementation for that view.
2. Assume the custom view has subviews that at laid out in the .xib and these are laid out using constraints and autolayout.
3. Now let's assume we want to use the custom view in another storyboard or .xib. Ideally, we'd lay out the view on the separate storyboard (or .xib) and assign this view the custom views class. And when the storyboard/.xib is loaded from the nib, the custom view is also loaded.

The challenge is this approach does not work out-of-the-box. The EmbeddedView was specifically implemented to address this situation.

Usage

When we want to use a custom view in a storyboard/.xib, and the custom view was laid out in another .xib, create the custom view as a subclass of EmbeddedView.  Seet the nibName property of the custom view to the name of its .xib

Additionally, set the file owner of the custom view's .xib to the custom view class (which is a subclass of Embedded View), DO NOT set the class of the custom view.

Finally, layout a container view in the separate storyboard/.xib and set it's constraints appropriately. Then, set it's class to the class of the custom view.

The custom view will then be loaded into the container view when the container view is loaded from the nib, and all the custom view's constraints will honored inside the container view.
