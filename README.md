# README


## Trivia Town

Create quizzes for your friends and take your friends quizzes. See who can get the highest scores and make new friends. Trivia Town is a user generated quiz app.
Challenge friends, make new friends and learn some things along the way.


## Installation

### Setup
1. Clone [this repository](https://github.com/81Jeremiah/trivia-town) to your local development environment.
2. `cd` into your trivia-town director and run `bundle install`.
3. Set up your database by running `rake db:migrate` from the terminal
4. Run `rails s` to start up a server
5. Start writing some quizzes!


### Notes
* If using facebook login, please use `thin start --ssl` instead of `rails s` for your local host.

## Built with
* Rails '~> 5.2.1'
* Bcrypt
* Bootstrap-sass - theme heavily inspired by Flatiron School's Amusement Park lesson
* Omniauth
* Ruby '2.3.3'


## Contributing

When contributing to this repository, please first discuss the change you wish to make via issue,
email, or any other method with the owners of this repository before making a change.

### Pull Request Process
1. Update the README.md with details of changes to the interface, this includes new environment
   variables, exposed ports, useful file locations and container parameters.
2. Increase the version numbers in any examples files and the README.md to the new version that this
   Pull Request would represent.
3. For now, I'll perform the merge after I review any pull requests.

## Author
*[Jeremiah Lutes](https://github.com/81Jeremiah)

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments
This app was built as part of a portfolio requirement for {[Flatiron School](https://flatironschool.com/). Specific features and the flow of the app are inspired by their direction and guidance.
