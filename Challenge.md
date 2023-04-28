# Technology Assessment

## Problem Statement:

Build a simple app to hit the NY Times Most Popular Articles API and show a list of articles,
that shows details when items on the list are tapped (a typical master/detail app).
We'll be using the most viewed section of this API.

http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{section}/{period}.json?api-
key=sample-key

To test this API, you can use all-sections for the section path component in the URL above
and 7 for period (available period values are 1, 7 and 30, which represents how far back, in
days, the API returns results for).

http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-
key=sample-key

## Deliverables:

Developed code should be pushed to GitHub with a clear ReadMe.md explaining how to
build and run the code. What we care about:

* object oriented programming approach
* Good UI approach e.g. MVC, etc.
* Unit test and code coverage
* code to be generic and simple
* leverage today's best coding practices
* clear README.md that explains how the code and the test can be run and how the
coverage reports can be generated
    
## Note:

* Create a GitHub repository, ensure the name is generic and doesn’t have any company
names. Commit your code to the GitHub repository and share the link with us. Only share a
link, do not send the actual code files

## Follow up Discussion:
After completing the exercise please be ready for 15 minutes’ discussion on your key
decisions, assumptions and rationale for your implementation.
