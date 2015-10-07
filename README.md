# rundeck-cd

> A set of build tasks to integrate [Rundeck](http://rundeck.org/) with your
Continuous Delivery server, implemented with [Rundeck Ruby](http://blessing.io/rundeck-ruby/)

## Motivation

To run pre configured Rundeck jobs without having to learn the Rundeck API.

## Requirements

* [Docker](http://docker.io/)
* [rbenv](http://rbenv.org/)

## Installation

1. Install requirements listed above
2. ```./go``` to validate the project is setup correctly

## Usage

    Usage: ./go <command>

    Available commands are:
      info                        View Rundeck server meta data
      execute_job[development]    Run the job_id configured for the development environment
      execute_job[staging]        Run the job_id configured for the staging environment
      execute_job[production]     Run the job_id configured for the production environment

## Integration Tests

This project has a suite of integration tests covering the main functionality of the project.

If you modify the project and want to verify your changes (and that you haven't broken anything else), run the tests with the ```./go spec``` command.

## Author

Jen Scobie (jenscobie@gmail.com)
