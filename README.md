# rundeck-cd

> A set of build tasks to integrate [Rundeck](http://rundeck.org/) with your
Continuous Delivery server

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
      server_info             View Rundeck server meta data
      promote[development]    Run the job_id configured for the development environment
      promote[staging]        Run the job_id configured for the staging environment
      promote[production]     Run the job_id configured for the production environment

## Author

Jen Scobie (jenscobie@gmail.com)
