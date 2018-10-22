### SEAT Approach

When testing we like to take the SEAT approach:

Set up the necessary objects
Execute the code against the object we're testing
Assert the results of the exception
Tear down and clean up any lingering artifacts

To set up the necessary objects, we could use the `setup` method which will be executed before each test.

We could then use `teardown` which will be called after running every test.

Typical setup and teardown work can be something like opening a file. For the test we need to open and pull date from a file (setup), and then before the test is over we want to close the file (teardown).
