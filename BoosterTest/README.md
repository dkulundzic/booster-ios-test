#  Booster test app

## App architecture

The app uses the VIPER architecture that I found to be most modular and scalable, as well as easy to read. In my experience,
VIPER is like Lego and developers get used to it pretty easily. 

Of course, VIPER does have some overhead with quite a few entities and files, but nothing that cannot be solved by using some
nifty templates to create everything needed.

I'm a big proponent of VIPER, as I think it makes development easier and more predictable, albeit a bit more tedious.

## UI process

The whole UI is built in code (via `SnapKit`), as I think it's a lot more robust and architecture supporting, as well as supporting for high levels
of reuseability and composeability. 

## App modularity

App modularity and well defined API boundaries are some things that I care about, and I feel that creating separate modules (similar
to packages in the Java/Kotlin world) is a great way to imprint a proper, modular way of reasoning about a codebase. 

The app uses frameworks to split the codebase into multiple reusable pieces of code.

### Localization framework

The `Localization` framework hosts everything needed to provide localization to an app, including strongly-typed keys and the `.strings` file
hosting the actual text.

### Model framework

The `Model` framework carries all Model information, such as types that model the entities used and different types that are used to closely
interact with these models.

### Networking

The `Networking` framework usually hosts all networking code, such as different services and types related to the network layer of the app. 
Usually, I use `Alamofire`, as it simplifies things and is well maintained and reliable. The model I use for networking is the Router model,
via different dedicated resources. 

You can find out more on the `feature/backend-integration branch`, where I implemented a simple networking layer implementation, based on a
very simple Vapor backend. This was not included within the reviewable codebase, as I'm not a backend developer.

If interested, you can build and run https://github.com/dkulundzic/booster-test-api.git to run the server locally and run the app of 
`feature/backend-integration branch`, to see it in action. I built the simple backend in a staggeringly low amount of time.  

### System

The `System` framework holds utility types that ease minute tasks, such as creating `NSAttributedString` instance, or similar. 

### Framework dependency

Modularity like this enables code reusability to a high degree, even between different frameworks, as you can check if you inspect different
framework targets and their dependency/linking setup.

## Technology 

I've used some newer technology in the app, such as `async/await`, Combine, compositional layouts and diffable data sources, which simplify things
quite a bit and make it easier to reason about and maintain.  

## Dependency management

The dependency management system is SPM. I always (where possible) opt-in for SPM as it's quite lightweight and, or course, is maintained and
developed by the Big A. 

## Git process

Regarding Git, the flow I use is Git Flow, with PR for submitting new code into `dev`. 

## Tests

Test targets have been created, but I haven't implemented any tests, due to straightforwardness.

## Closing words 

I hope I provided a good overview of the codebase. If you have any questions, feel free to reach out :) 
