### Testing Terminology

In the world of testing, a whole new vocabulary is necessary to talk about the new concepts. There is a lot of jargon when working with tests, but for now, we'll just focus on a few terms below.

- **Test Suite**: this is the entire set of tests that accompanies your program or application. You can think of this as all the tests for a project.
- **Test**: this describes a situation or context in which tests are run. For example, this test is about making sure you get an error message after trying to log in with the wrong password. A test can contain multiple assertions.
- **Assertion**: this is the actual verification step to confirm that the data returned by your program or application is indeed what is expected. You make one or more assertions within a test.

```ruby
Run options: --seed 62238

# Running:

CarTest .

Finished in 0.001097s, 911.3428 runs/s, 911.3428 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```



There are many options in Minitest, including various formatting options, but the default output looks like the above.

The "seed" tells Minitest what order the tests were run in.

The next thing we notice is the single `.`. This means the test was run and nothing went wrong. If you skip a test with the "skip" keyword, it'll say "S". If you have a failure, it'll say "F".
